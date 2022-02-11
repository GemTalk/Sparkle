Class {
	#name : 'SpkDebuggerTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'processManager',
		'process',
		'whyDebugged',
		'currentExplanation',
		'frames',
		'replacementTool'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'other' }
SpkDebuggerTool >> checkForTermination [

	(self isValid and: [process _isTerminated])
		ifTrue: [replacementTool := SpkProcessTerminatedTool forProcess: process]
]

{ #category : 'accessing' }
SpkDebuggerTool >> currentExplanation: anExplanation [
	"Stepping does not update the exceptionOfRecord, but
	must update currentException so that glue frame discarding will be accurate."

	currentExplanation := anExplanation.
	"Proceed and terminate set to nil, so we will re-initialize."
	whyDebugged ifNil: [ whyDebugged := anExplanation description ]
]

{ #category : 'accessing' }
SpkDebuggerTool >> explorerTool [
	^explorerTool
]

{ #category : 'accessing' }
SpkDebuggerTool >> explorerTool: object [
	explorerTool := object
]

{ #category : 'accessing' }
SpkDebuggerTool >> frameAt: anInteger [
	^ self frames at: anInteger
]

{ #category : 'accessing' }
SpkDebuggerTool >> frames [
	^ frames
]

{ #category : 'other' }
SpkDebuggerTool >> indexOfFrameInLast: limit suchThat: aBlock [
	"Search up to limit frames, starting at the end of my frames,
	and answer the index of the first to satisfy aBlock, or nil if none."

	frames size to: ((frames size - limit + 1) max: 1) by: -1 do: [ :index | 
		| frame |
		frame := frames at: index.
		(aBlock value: frame)
			ifTrue: [ ^ index ] ].
	^ nil
]

{ #category : 'initialization' }
SpkDebuggerTool >> initialize [
	super initialize.
	frames := OrderedCollection new.
	replacementTool := self
]

{ #category : 'initialization' }
SpkDebuggerTool >> initializeDefaultInExplorer: xTool [
	explorerTool := xTool.
	self refreshFromProcess
]

{ #category : 'other' }
SpkDebuggerTool >> invalidateFramesAfter: numberOfValidFrames [
	"Some existing frames (the bottom of the stack) are still valid.
	Let the frame tools that are no longer on the stack know they are 
	no longer valid."

	numberOfValidFrames + 1 to: frames size do: [ :index | (frames at: index) beInvalid ]
]

{ #category : 'other' }
SpkDebuggerTool >> isValid [
	^ self == replacementTool
]

{ #category : 'other' }
SpkDebuggerTool >> markBottomGlueFrames [
	"Some of the frames at the bottom of the stack aren't sensible
	to display to a user in the debugger. They support the execution
	the user's program and shouldn't be directly debugged.
	Mark them as glue frames."

	self
		markBottomGlueFramesForForkedProcess;
		markBottomGlueFramesForSparkleEvaluator.
]

{ #category : 'other' }
SpkDebuggerTool >> markBottomGlueFramesForForkedProcess [
	"Detect and mark the following frames when they are the first frames on the stack.
	ExecBlock >> valueWithArguments:
	GsProcess >> _start
	GsNMethod class >> _gsReturnToC"

	| valueFrame startFrame returnToCFrame |
	valueFrame := frames at: 3.
	(valueFrame receiver class == ExecBlock and: [valueFrame method selector == #'valueWithArguments:'])
		ifFalse: [^self].
	startFrame := frames at: 2.
	(startFrame receiver class == GsProcess and: [startFrame method selector == #'_start'])
		ifFalse: [^self].
	returnToCFrame := frames at: 1.
	(returnToCFrame receiver class == GsNMethod class and: [returnToCFrame method selector == #'_gsReturnToC'])
		ifFalse: [^self].
	self
		markGlueFramesFrom: 1
		to: 3
]

{ #category : 'other' }
SpkDebuggerTool >> markBottomGlueFramesForSparkleEvaluator [
	"Detect and mark up to and including the following frames.
   GsNMethod >> _executeInContext:
   [] in SpkEvaluatorTool >> evaluateMethod:inContext:"

	| index |
	index := 2.
	[ index <= 15 and: [ index < frames size ] ]
		whileTrue: [ 
			| current parent |
			current := frames at: index.
			parent := frames at: index - 1.
			(current receiver class == GsNMethod
				and: [ 
					current method selector == #'_executeInContext:'
						and: [ 
							parent isBlockFrame
								and: [ 
									parent method inClass == SpkEvaluatorTool
										and: [ parent method homeMethod selector == #'evaluateMethod:inContext:' ] ] ] ])
				ifTrue: [ 
					self markGlueFramesFrom: 1 to: index.
					^ self ].
			index := index + 1 ]
]

{ #category : 'other' }
SpkDebuggerTool >> markGlueFrames [
	"Identify the frames at the top and bottom of the stack which should be hidden for the purposes
	of providing a sensible debugger view for the process."

	self
		markBottomGlueFrames;
		markTopGlueFrames
]

{ #category : 'other' }
SpkDebuggerTool >> markGlueFramesFrom: start
to: end [

	start to: end do: [:i | (frames at: i) markGlue]
]

{ #category : 'other' }
SpkDebuggerTool >> markTopGlueForBreakpoint: aBreakpoint [
	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | 
			frame receiver == aBreakpoint
				and: [ frame method selector == #'_signalAsync:' ] ].
	indexOfFirstDiscardedFrame
		ifNotNil: [ self markGlueFramesFrom: indexOfFirstDiscardedFrame to: frames size ]
		ifNil: [ self markTopGlueForException: aBreakpoint ]
]

{ #category : 'other' }
SpkDebuggerTool >> markTopGlueForException: anException [
	"Search for, in order of preference, this exception being sent #signal, being sent #_signalToDebugger,
	and if still not found, fall back to the process manager debugAction block. If *still* not found,
	this process is not under management and will not have any frames marked."

	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | frame receiver == anException and: [ frame method selector == #'signal' ] ].

	indexOfFirstDiscardedFrame
		ifNil: [ 
			indexOfFirstDiscardedFrame := self
				indexOfFrameInLast: 20
				suchThat: [ :frame | 
					frame receiver == anException
						and: [ frame method selector == #'_signalFromPrimitive:' ] ] ].

	indexOfFirstDiscardedFrame
		ifNil: [ 
			indexOfFirstDiscardedFrame := self
				indexOfFrameInLast: 20
				suchThat: [ :frame | 
					frame receiver == anException
						and: [ frame method selector == #'_signalToDebugger' ] ] ].

	indexOfFirstDiscardedFrame
		ifNil: [ 
			indexOfFirstDiscardedFrame := self
				indexOfFrameInLast: 20
				suchThat: [ :frame | 
					| homeMethod |
					homeMethod := frame method homeMethod.
					frame method ~~ homeMethod
						and: [ 
							homeMethod inClass == SpkProcessManager
								and: [ homeMethod selector == #'debugAction' ] ] ] ].

	indexOfFirstDiscardedFrame
		ifNotNil: [ self markGlueFramesFrom: indexOfFirstDiscardedFrame to: frames size ]
]

{ #category : 'other' }
SpkDebuggerTool >> markTopGlueForHalt: aHalt [
	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | 
			| method |
			method := frame method.
			method inClass == Object
				and: [ method selector == #'halt' or: [ method selector == #'pause' ] ] ].
	indexOfFirstDiscardedFrame
		ifNotNil: [ self markGlueFramesFrom: indexOfFirstDiscardedFrame to: frames size ]
		ifNil: [ self markTopGlueForException: aHalt ]
]

{ #category : 'other' }
SpkDebuggerTool >> markTopGlueFrames [
	"At the end of frames (top frames of the stack) are some frameTools that
	are internal and not desirable for interaction in a debugger.
	Identify those and mark them as glue."

	currentExplanation markTopGlueFor: self
]

{ #category : 'accessing' }
SpkDebuggerTool >> newDebuggerFrameTool [
	"Create and initialize a new DebuggerFrameTool instance."

	^SpkDebuggerFrameTool new
		taskspaceTool: taskspaceTool;
		explorerTool: explorerTool;
		debuggerTool: self;
		process: process;
		yourself
]

{ #category : 'accessing' }
SpkDebuggerTool >> nonGlueFrames [

	^self frames reject: [:each | each isGlue]
]

{ #category : 'actions' }
SpkDebuggerTool >> proceed [
	"May wait for an answer, depending on whether the process is an evaluation process"
	self flag: 'Now used only by tests, which should be updated.'.
	^ self proceedAnnouncing: SpkExecutionAnnouncement new.
]

{ #category : 'actions' }
SpkDebuggerTool >> proceedAnnouncing: anAnnouncement [
	"May wait for an answer, depending on whether the process is an evaluation process.
	Announce the announcement when done."

	whyDebugged := nil.	"If we hit another exception, we want the exception to be updated."
	^ self resumeAnnouncing: anAnnouncement
]

{ #category : 'actions' }
SpkDebuggerTool >> proceedIfInGlueAnnouncing: anAnnouncement [
	"If we have stepped off the end of 'user' code, proceed the process to let it run through the bottom glue.
In case this execution changes any inspected objects (for instance, the process itself) go through
another round of announcing, with the same announcement since it's still the same client request."

	self checkForTermination.
	(self isValid and: [ self nonGlueFrames isEmpty ])
		ifTrue: [ self proceedAnnouncing: anAnnouncement ]
]

{ #category : 'accessing' }
SpkDebuggerTool >> process [

	^ process
]

{ #category : 'accessing' }
SpkDebuggerTool >> process: aProcess [
	"The GsProcess that I am to debug."

	process := aProcess
]

{ #category : 'accessing' }
SpkDebuggerTool >> processIdentifier [
	^ SpkReflection identifierOf: process
]

{ #category : 'accessing' }
SpkDebuggerTool >> processManager: object [
	processManager := object
]

{ #category : 'accessing' }
SpkDebuggerTool >> processName [
	^ process name
]

{ #category : 'accessing' }
SpkDebuggerTool >> processPriority [
	^ process priority
]

{ #category : 'other' }
SpkDebuggerTool >> receiveExecutionAnnouncement: anAnnouncement [
	"Execution has happened; if we are still debugging update my
	own state then let others (like my service) know."

	self checkForTermination.
	self isValid
		ifTrue: [ 
			self refreshFromProcess.
			self nonGlueFrames
				do: [ :frame | frame receiveExecutionAnnouncement: anAnnouncement ] ].
	self announce: anAnnouncement.
	self proceedIfInGlueAnnouncing: anAnnouncement
]

{ #category : 'initialization' }
SpkDebuggerTool >> refreshExistingFrames [
	"Update any frames at the bottom of the stack that still
	represent the same frame. Answerthe number of frames
	that are still valid.
	For a new debugger, frames size is 0."

	| numberOfValidFrames newStackDepth |
	numberOfValidFrames := 0.
	newStackDepth := process stackDepth.
	1 to: (frames size min: newStackDepth) do: [ :index | 
		| level frame |
		level := newStackDepth - index + 1.
		frame := frames at: index.
		frame refreshAtLevel: level.
		(frame methodHasChanged or: [ frame receiverHasChanged ])
			ifTrue: [ ^ numberOfValidFrames ].
		numberOfValidFrames := numberOfValidFrames + 1.
		frame stepPointHasChanged
			ifTrue: [ ^ numberOfValidFrames ] ].
	^ numberOfValidFrames
]

{ #category : 'initialization' }
SpkDebuggerTool >> refreshFromProcess [
	"Keep the FrameTools for any still-valid bottom portion of the stack.
	The service layer uses identity of frame tools to determine what needs refreshing."

	| numberOfValidFrames newStackDepth newFrames |
	numberOfValidFrames := self refreshExistingFrames.
	self invalidateFramesAfter: numberOfValidFrames.
	newStackDepth := process stackDepth.
	newFrames := OrderedCollection new: newStackDepth.
	newFrames
		replaceFrom: 1
		to: numberOfValidFrames
		with: frames
		startingAt: 1.
	numberOfValidFrames + 1 to: newStackDepth do: [ :index | 
		| frame level |
		level := newStackDepth - index + 1.
		frame := self newDebuggerFrameTool.
		frame
			index: index;
			refreshAtLevel: level.
		newFrames at: index put: frame ].
	frames := newFrames.
	self markGlueFrames.
	^ frames
]

{ #category : 'actions' }
SpkDebuggerTool >> replacementTool [
	^ replacementTool
]

{ #category : 'actions' }
SpkDebuggerTool >> resumeAnnouncing: anAnnouncement [
	"Resume the process, then make the announcement"

	"Used for both stepping and proceed."

	replacementTool := processManager resumeProcessAndWait.
	taskspaceTool announce: anAnnouncement.
	self flag: 'Return value only used only by tests, which should be updated.'.
	^ replacementTool
]

{ #category : 'other' }
SpkDebuggerTool >> taskspaceTool: aTool [
	super taskspaceTool: aTool.
	taskspaceTool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self
]

{ #category : 'actions' }
SpkDebuggerTool >> terminateAnnouncing: anAnnouncement [
	"May wait for an answer, depending on whether the process is an evaluation process"

	whyDebugged := nil.	"If we hit another exception, we want the exception to be updated."
	replacementTool := processManager terminateProcess.
	taskspaceTool announce: anAnnouncement.
	^ replacementTool
]

{ #category : 'accessing' }
SpkDebuggerTool >> whyDebugged [
	^ whyDebugged ifNil: [ 'Unknown' ] ifNotNil: [ :w | w ]
]
