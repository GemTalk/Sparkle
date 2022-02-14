Class {
	#name : 'SpkProcessManager',
	#superclass : 'SpkObject',
	#instVars : [
		'process',
		'processPriority',
		'taskspaceTool',
		'debuggerDebugAction',
		'debuggerTool',
		'result',
		'resultReady',
		'announceNextDebug'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'private - debugger process' }
SpkProcessManager >> announceDebug [
	"Typically this announcement will open a new explorer window on the client,
	containing a debugger for my debuggerTool."

	taskspaceTool announceNewExplorerForPaneTool: debuggerTool
]

{ #category : 'accessing' }
SpkProcessManager >> announceNextDebug: aBoolean [
	announceNextDebug := aBoolean
]

{ #category : 'accessing' }
SpkProcessManager >> debugAction [
	^ [ :ex | 
	taskspaceTool
		debug: Processor activeProcess
		explanation: (self explain: ex).
	nil ]
]

{ #category : 'accessing' }
SpkProcessManager >> debuggerDebugAction: aBlock [

	"This is the debug action block that should handle any errors in the debugger process
	(which should generally not invoke the same debugger). A typical block is the one
	that RSR sets to just break the promise with the stack as the reason."

	debuggerDebugAction := aBlock
]

{ #category : 'private - debugger process' }
SpkProcessManager >> debuggerProcessDebugBecause: anExplanation [
	"The part of the body of the debugger process that deals with setting up the debugger tool to debug the given exception."

	process suspend.
	debuggerTool
		ifNil: [ self initializeDebuggerToolWithExplanation: anExplanation ]
		ifNotNil: [ :dTool | dTool currentExplanation: anExplanation ]
]

{ #category : 'private - debugger process' }
SpkProcessManager >> debuggerProcessFor: anExplanation [
	"Answer a new debugger process for a new or existing debugger,
	debugging process. Start by suspending the process."

	| debuggerProcess |
	debuggerProcess := 
		[self debuggerProcessDebugBecause: anExplanation.
		announceNextDebug
			ifTrue: [ 
				announceNextDebug := false.
				self announceDebug ]
			ifFalse: [self returnValue: debuggerTool]] newProcess.
	debuggerProcess name: 'Debugger for ' , process asOop printString.
	^ debuggerProcess
]

{ #category : 'private' }
SpkProcessManager >> debugWithExplanation: anExplanation [

	"process may be the active process on entry to this method.
	Set up a new higher-priority Process to debug it."

	| debuggerProcess |
	processPriority := process priority.
	self setDebugAction. "Debug action may not be correct the first exception for this process."
	debuggerProcess := self debuggerProcessFor: anExplanation.

	self
		setPrioritiesOfDebugger: debuggerProcess
		relativeToDebugged: process.
	debuggerProcess
		debugActionBlock: debuggerDebugAction;
		"This resume preempts the debugged process, and the debuggerProcess takes over."
		resume.
	"If I get here, the debugger has decided to resume my process for step or proceed."
]

{ #category : 'accessing' }
SpkProcessManager >> explain: anException [
	^ SpkAtException for: anException
]

{ #category : 'initialization' }
SpkProcessManager >> initialize [

	super initialize.
	resultReady := Semaphore new.
	announceNextDebug := false
]

{ #category : 'initialization' }
SpkProcessManager >> initializeDebuggerToolWithExplanation: anExplanation [
	debuggerTool := SpkDebuggerTool new
		taskspaceTool: taskspaceTool;
		process: process;
		processManager: self;
		currentExplanation: anExplanation;
		yourself
]

{ #category : 'private' }
SpkProcessManager >> newTerminatedTool [
	^ SpkProcessTerminatedTool forProcess: process
]

{ #category : 'accessing' }
SpkProcessManager >> process: aProcess [
	process ifNotNil: [self error: 'Already managing a process.'].
	process := aProcess.
	taskspaceTool registerManager: self forProcess: aProcess
]

{ #category : 'accessing' }
SpkProcessManager >> processPriority: anInteger [
	processPriority := anInteger
]

{ #category : 'private' }
SpkProcessManager >> resumeProcess [
	process _isTerminated
		ifTrue: [ ^ self newTerminatedTool ].	"

	Debug action might be right already, but simpler to always set it"
	self setDebugAction.

	"If the debugged process normally runs at the highest priority,
	its priority will have been lowered by one so the debugger can
	run at a higher priority. If so, restore priority before resuming."
	process priority ~= processPriority 
		ifTrue: [process priority: processPriority].
	process resume
]

{ #category : 'actions' }
SpkProcessManager >> resumeProcessAndWait [
	"Evaluation process waits for an answer and returns it"

	self resumeProcess.
	^ self waitForResult
]

{ #category : 'actions' }
SpkProcessManager >> returnValue: anObject [

	result := anObject.
	resultReady signal
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
	"Evaluation process waits for termination to be complete and returns the tool.
	processBody must send me #returnValue: on completion of termination or this will hang."

	process _isTerminated
		ifTrue: [ ^ self newTerminatedTool ].
	"If the process has started terminating, don't terminate again,
	just proceed to let the unwind blocks run."
	self flag: 'The response to _terminationStarted is definitely not right. 
				It answers the ProcessManager, not a tool of any kind.
				Also, it may not be thread safe -- the test for _terminationStarted 
				and the response may need to be in a critical section.'.
	process _terminationStarted ifTrue: [^ self resumeProcess ].
	[ process trimStackToLevel: process stackDepth - 2 ]
		forkAt: (process priority + 1 min: Processor highestPriority).
	^ self waitForResult
]

{ #category : 'actions' }
SpkProcessManager >> waitForResult [
	"Result may be a debugger"

	resultReady wait.
	^ result
]
