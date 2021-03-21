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

{ #category : 'as yet unclassified' }
SpkProcessManager >> debugException: anException [

	| processToDebug |
	processToDebug := Processor activeProcess.
	"Either the process is mine, or it was forked from mine and inherited the debug action and therefore sent me a message"
	processToDebug == process
		ifTrue: [ self debugMyProcessWithException: anException ]
		ifFalse: [ 
		self debugForeignProcess: processToDebug withException: anException ]
]

{ #category : 'as yet unclassified' }
SpkProcessManager >> debugForeignProcess: processToDebug withException: anException [

	"This process is not my problem, create another manager for it
	and pass the buck."

	SpkProcessManager new
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

{ #category : 'as yet unclassified' }
SpkProcessManager >> debuggerMustInitiate [

	^ true
]

{ #category : 'as yet unclassified' }
SpkProcessManager >> debuggerProcessForException: anException [
	"Answer a new debugger process for a new or existing debugger,
	debugging process. Start by suspending the process."

	^ [ 
	process suspend.
	debuggerTool ifNil: [ self initializeDebuggerTool ].
	debuggerTool
		currentException: anException;
		debug ] newProcess
]

{ #category : 'as yet unclassified' }
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

{ #category : 'initialization' }
SpkProcessManager >> explorerTool [
	self flag: 'Need to implement'.
	self
		halt:
			'Debugging forked processes with no explorer tool is not yet implemented.'
]

{ #category : 'initialization' }
SpkProcessManager >> initializeDebuggerTool [

	debuggerTool := SpkDebuggerTool new
		                taskspaceTool: taskspaceTool;
						explorerTool: self explorerTool;
		                process: process;
		                processManager: self;
		                mustInitiate: self debuggerMustInitiate;
						refreshFromProcess;
		                yourself
]

{ #category : 'as yet unclassified' }
SpkProcessManager >> proceedProcess [
	"Non-evaluation process does not wait for an answer."

	self resumeProcess
]

{ #category : 'accessing' }
SpkProcessManager >> process: anObject [

	process := anObject
]

{ #category : 'as yet unclassified' }
SpkProcessManager >> resumeProcess [

	"Debug action might be right already, but simpler to always set it"

	self setDebugAction.
	process resume
]

{ #category : 'initialization' }
SpkProcessManager >> setDebugAction [

	process debugActionBlock: self debugAction
]

{ #category : 'other' }
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
