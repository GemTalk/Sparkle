Class {
	#name : 'SpkDebuggerTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'processManager',
		'process',
		'exceptionOfRecord',
		'currentException',
		'frames',
		'mustInitiate',
		'replacementTool'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkDebuggerTool >> currentException: anException [
	"Stepping does not update the exceptionOfRecord, but
	must update currentException so that glue frame discarding will be accurate."

	currentException := anException.	
	"Proceed and terminate set to nil, so we will re-initialize."
	exceptionOfRecord ifNil: [ exceptionOfRecord := anException ]
]

{ #category : 'private' }
SpkDebuggerTool >> debug [
	mustInitiate
		ifFalse: [ processManager returnValue: self ]
		ifTrue: [ self error: 'Debugging forked processes not yet fully implemented.' ]
]

{ #category : 'other' }
SpkDebuggerTool >> discardGlueFrames [
	"At the end of frames (top frames of the stack) are some frameTools that
	are internal and not desirable for interaction in a debugger.
	Identify those and reduce the size of frames to discard them."

	| exceptionClass |
	exceptionClass := currentException class.
	exceptionClass == Breakpoint
		ifTrue: [ ^ self discardGlueFramesForBreakpoint ].
	exceptionClass == Halt
		ifTrue: [ ^ self discardGlueFramesForHalt ].
	self discardGlueFramesForGenericException
]

{ #category : 'other' }
SpkDebuggerTool >> discardGlueFramesForBreakpoint [
	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | 
			frame receiver == currentException
				and: [ frame method selector == #'_signalAsync' ] ].
	indexOfFirstDiscardedFrame
		ifNotNil: [ frames size: indexOfFirstDiscardedFrame - 1 ]
		ifNil: [ self discardGlueFramesForGenericException ]
]

{ #category : 'other' }
SpkDebuggerTool >> discardGlueFramesForGenericException [
	"Search for, in order of preference, this exception being sent #signal, being sent #_signalToDebugger,
	and if still not found, fall back to the process manager debugAction block. If *still* not found,
	this process is not under management and will not have any frames discarded."

	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | frame receiver == currentException and: [ frame method selector == #'signal' ] ].

	indexOfFirstDiscardedFrame
		ifNil: [ 
			indexOfFirstDiscardedFrame := self
				indexOfFrameInLast: 20
				suchThat: [ :frame | 
					frame receiver == currentException
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
		ifNotNil: [ frames size: indexOfFirstDiscardedFrame - 1 ]
]

{ #category : 'other' }
SpkDebuggerTool >> discardGlueFramesForHalt [
	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | 
			| method |
			method := frame method.
			method inClass == Object
				and: [ method selector == #'halt' or: [ method selector == #'pause' ] ] ].
	indexOfFirstDiscardedFrame
		ifNotNil: [ frames size: indexOfFirstDiscardedFrame - 1 ]
		ifNil: [ self discardGlueFramesForGenericException ]
]

{ #category : 'accessing' }
SpkDebuggerTool >> exceptionDescription [
	| string |
	string := String new.
	exceptionOfRecord
		ifNil: [ string add: 'Unknown' ]
		ifNotNil: [ 
			string
				add: exceptionOfRecord class name;
				add: self exceptionSpecificMessage ].
	^ string
]

{ #category : 'private' }
SpkDebuggerTool >> exceptionSpecificMessage [
	| fullMessage commaIndex latterPart |
	fullMessage := exceptionOfRecord buildMessageText.
	fullMessage ifNil: [ ^ '' ].
	commaIndex := fullMessage indexOf: $,.
	latterPart := commaIndex = 0
		ifTrue: [ fullMessage ]
		ifFalse: [ fullMessage copyFrom: commaIndex + 1 to: fullMessage size ].
	^ ' - ' , latterPart
]

{ #category : 'accessing' }
SpkDebuggerTool >> explorerTool [
	^explorerTool
]

{ #category : 'accessing' }
SpkDebuggerTool >> explorerTool: object [
	explorerTool := object.
	explorerTool addPane: self
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

	frames size to: frames size - limit + 1 by: -1 do: [ :index | 
		| frame |
		frame := frames at: index.
		(aBlock value: frame)
			ifTrue: [ ^ index ] ].
	^ nil
]

{ #category : 'initialization' }
SpkDebuggerTool >> initialize [
	super initialize.
	frames := #().
	replacementTool := self
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
		ifFalse: [ false ]
		ifTrue: [ 
			process _isTerminated
				ifFalse: [ true ]
				ifTrue: [ 
					replacementTool := SpkProcessTerminatedTool forProcess: process.
					false ] ]
]

{ #category : 'accessing' }
SpkDebuggerTool >> mustInitiate: object [
	mustInitiate := object
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

	exceptionOfRecord := nil.	"If we hit another exception, we want the exception to be updated."
	^ self resumeAnnouncing: anAnnouncement
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

	self isValid
		ifTrue: [ 
			self refreshFromProcess.
			frames do: [ :frame | frame receiveExecutionAnnouncement: anAnnouncement ] ].
	self announce: anAnnouncement
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
	self discardGlueFrames.
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

	replacementTool := processManager proceedProcess.
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

	exceptionOfRecord := nil.	"If we hit another exception, we want the exception to be updated."
	replacementTool := processManager terminateProcess.
	taskspaceTool announce: anAnnouncement.
	^ replacementTool
]
