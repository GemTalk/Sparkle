Class {
	#name : 'SpkProcessManager',
	#superclass : 'SpkObject',
	#instVars : [
		'process',
		'taskspaceTool',
		'debuggerDebugAction',
		'debuggerTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkProcessManager >> debugAction [

	^ [:ex | self debugException: ex. nil]
]

{ #category : 'private' }
SpkProcessManager >> debugException: anException [

	| processToDebug |
	processToDebug := Processor activeProcess.
	"Either the process is mine, or it was forked from mine and inherited the debug action and therefore sent me a message"
	processToDebug == process
		ifTrue: [ self debugMyProcessWithException: anException ]
		ifFalse: [ 
		self debugForeignProcess: processToDebug withException: anException ]
]

{ #category : 'private' }
SpkProcessManager >> debugForeignProcess: processToDebug withException: anException [

	"This process is not my problem, create another manager for it
	and pass the buck."

	SpkProcessManager new
		taskspaceTool: taskspaceTool;
		process: processToDebug;
		debugException: anException
]

{ #category : 'accessing' }
SpkProcessManager >> debuggerDebugAction: aBlock [

	"This is the debug action block that should handle any errors in the debugger process
	(which should generally not invoke the same debugger). A typical block is the one
	that RSR sets to just break the promise with the stack as the reason."

	debuggerDebugAction := aBlock
]

{ #category : 'accessing' }
SpkProcessManager >> debuggerMustInitiate [

	^ true
]

{ #category : 'private' }
SpkProcessManager >> debuggerProcessForException: anException [
	"Answer a new debugger process for a new or existing debugger,
	debugging process. Start by suspending the process."

	| debuggerProcess |
	debuggerProcess := [ 
	process suspend.
	debuggerTool ifNil: [ self initializeDebuggerTool ].
	debuggerTool
		currentException: anException;
		refreshFromProcess;
		debug ] newProcess.
	debuggerProcess name: 'Debugger for ' , process asOop printString.
	^ debuggerProcess
]

{ #category : 'private' }
SpkProcessManager >> debugMyProcessWithException: anException [

	"process is the active process on empty. Set up a new higher-priority Process to debug it."

	| debuggerProcess originalPriority |
	originalPriority := process priority.
	self setDebugAction. "Debug action may not be correct the first exception for this process."
	debuggerProcess := self debuggerProcessForException: anException.

	self
		setPrioritiesOfDebugger: debuggerProcess
		relativeToDebugged: process.
	debuggerProcess
		debugActionBlock: debuggerDebugAction;
		"This resume preempts processToDebug, and the debuggerProcess takes over."
			resume.
	" If I get here, the debugger has decided to proceed my process.
	Its priority will have been changed if it was running at max priority, set it back before continuing."
	process priority: originalPriority
]

{ #category : 'accessing' }
SpkProcessManager >> explorerTool [

	^SpkExplorerTool newInTaskspace: taskspaceTool
]

{ #category : 'initialization' }
SpkProcessManager >> initializeDebuggerTool [

	debuggerTool := SpkDebuggerTool new
		taskspaceTool: taskspaceTool;
		explorerTool: self explorerTool;
		process: process;
		processManager: self;
		mustInitiate: self debuggerMustInitiate;
		yourself
]

{ #category : 'private' }
SpkProcessManager >> newTerminatedTool [
	^ SpkProcessTerminatedTool forProcess: process
]

{ #category : 'accessing' }
SpkProcessManager >> process: anObject [

	process := anObject
]

{ #category : 'private' }
SpkProcessManager >> resumeProcess [
	process _isTerminated
		ifTrue: [ ^ self newTerminatedTool ].	"

	Debug action might be right already, but simpler to always set it"
	self setDebugAction.
	process resume
]

{ #category : 'initialization' }
SpkProcessManager >> setDebugAction [

	process debugActionBlock: self debugAction
]

{ #category : 'private' }
SpkProcessManager >> setPrioritiesOfDebugger: debuggerProcess relativeToDebugged: processToDebug [
	"In order to reliably suspend the debugged process, the debugger must run at a higher priority.
	Normally, just run the debugger one higher, but if that's impossible lower the debugged process priority.
	It will be restored upon continue (see #evaluateMethod:inContext:)."

	| debuggedPriority |
	debuggedPriority := processToDebug priority.
	debuggedPriority = Processor highestPriority
		ifFalse: [ debuggerProcess priority: debuggedPriority + 1 ]
		ifTrue: [ 
			debuggerProcess priority: debuggedPriority.
			processToDebug priority: debuggedPriority - 1 ]
]

{ #category : 'accessing' }
SpkProcessManager >> taskspaceTool: anObject [

	taskspaceTool := anObject
]

{ #category : 'actions' }
SpkProcessManager >> terminateProcess [
	process _isTerminated
		ifTrue: [ ^ self newTerminatedTool ].
	"If the process has started terminating, don't terminate again,
	just proceed to let the unwind blocks run."
	process _terminationStarted ifTrue: [^ self resumeProcess ].
	[ process terminateTimeoutMs: SmallInteger maximumValue ]
		forkAt: (process priority - 1 max: 1)
]
