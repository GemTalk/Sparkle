"
I represent and manipulate a single stack frame within a GsProcess (#process)
#level is my position in the stack using the GsProcess numbering system, where level 1 is the top frame of the stack.
#index is my position in the Sparkle numbering system, where index 1 is the *bottom* frame of the stack.
The Sparkle numbering system allows my index to stay the same during stepping, when the number of frames above me may change, changing my #level.
"
Class {
	#name : 'SpkDebuggerFrameTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'debuggerTool',
		'process',
		'currentState',
		'previousState',
		'index',
		'isValid',
		'isGlue'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'private' }
SpkDebuggerFrameTool >> addArgAndTempToolsForIndex: anIndex to: aCollection [
	| tool |
	tool := self newInspectorFieldTool.
	aCollection add: tool.
	tool
		referencedObject: (self argAndTempValues at: anIndex);
		columnAt: 1 put: (self argAndTempNames at: anIndex);
		columnAt: 2 put: (tool selfDescriptionOf: tool referencedObject)
]

{ #category : 'private' }
SpkDebuggerFrameTool >> addArgAndTempToolsTo: aCollection [
	1 to: self firstEvaluationTempIndex - 1 do: [ :anIndex | self addArgAndTempToolsForIndex: anIndex to: aCollection ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> addEvaluationStackToolsTo: aCollection [
	| names values |
	names := self argAndTempNames.
	values := self argAndTempValues.
	names size = values size
		ifFalse: [ self error: 'Name and value size mismatch' ].
	self firstEvaluationTempIndex to: names size do: [ :anIndex | self addArgAndTempToolsForIndex: anIndex to: aCollection ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> addReceiverToolTo: aCollection [
	| tool |
	tool := self newInspectorFieldTool.
	aCollection add: tool.
	tool
		columnAt: 1 put: 'receiver';
		columnAt: 2 put: (tool selfDescriptionOf: self receiver);
		referencedObject: self receiver
]

{ #category : 'private' }
SpkDebuggerFrameTool >> argAndTempNames [
	^ currentState argAndTempNames
]

{ #category : 'private' }
SpkDebuggerFrameTool >> argAndTempValues [
	^ currentState argAndTempValues
]

{ #category : 'other' }
SpkDebuggerFrameTool >> beInvalid [
	isValid := false.
	taskspaceTool ifNotNil: [ taskspaceTool unsubscribe: self ]
]

{ #category : 'other' }
SpkDebuggerFrameTool >> canStep [
	"The ProcessorScheduler keeps a list of criticals methods which
	cannot be stepped through. We should prevent stepping to avoid
	an error."

	^(ProcessorScheduler scheduler _criticalMethods includes: currentState method) not
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> currentSourceInterval [

	^ currentState sourceInterval
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> debuggerTool: object [
	debuggerTool := object
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> description [
	^ currentState description
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> explorerTool [
	^explorerTool
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> explorerTool: object [
	explorerTool := object
]

{ #category : 'private' }
SpkDebuggerFrameTool >> firstEvaluationTempIndex [
	"Answer one greater than the number of normal args and temps.
	If there are any evaluation stack temps, this will be the index of the first one."

	| names |
	names := self argAndTempNames.

	1 to: names size do: [ :anIndex | 
		(names at: anIndex) first = $.
			ifTrue: [ ^ anIndex ] ].
	^ names size + 1
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> index [
	^index
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> index: object [
	index := object
]

{ #category : 'other' }
SpkDebuggerFrameTool >> initialize [
	super initialize.
	isValid := true.
	isGlue := false
]

{ #category : 'testing' }
SpkDebuggerFrameTool >> isBlockFrame [
	"Determines if the current frame is a BlockClosure rather than a method or other activation type."

	^self method isMethodForBlock
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> isGlue [

	^isGlue
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> localVariables [
	"Answer an OrderedCollection of InspectorFieldTools, one for each local variable.
	Local variables for a method include the receiver (self), the contents of the evaluation stack, 
	formal parameters, and declared temporary variables.
	Local variables for a block differ in that the receiver is the ExecBlock, not self, and include
	any outer scope variables actually referenced by the block. 
	Variables from an outer scope variables that are not referenced by the source code are not
	necessarily visible in a block frame."

	| tools |
	tools := OrderedCollection new.
	self
		addReceiverToolTo: tools;
		addEvaluationStackToolsTo: tools;
		addArgAndTempToolsTo: tools.

	^ tools
]

{ #category : 'private' }
SpkDebuggerFrameTool >> markGlue [

	isGlue := true
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> method [
	"Can answer nil if GCI or User Action, according to GsProcess>>_reportWithFrameContents:level:"

	^ currentState method
]

{ #category : 'post-refresh' }
SpkDebuggerFrameTool >> methodHasChanged [
	"Only valid after first initialization and at least one refresh."

	^ currentState method ~~ previousState method
]

{ #category : 'private' }
SpkDebuggerFrameTool >> newInspectorFieldTool [ 

	^ SpkInspectorFieldTool new
		  taskspaceTool: taskspaceTool;
		  numberOfColumns: 2;
		  yourself
]

{ #category : 'other' }
SpkDebuggerFrameTool >> newInspectorToolOn: anObject [
	^ explorerTool newInspectorToolOn: anObject
]

{ #category : 'printing' }
SpkDebuggerFrameTool >> printOn: aStream [
	currentState isNil
		ifTrue: [ ^ super printOn: aStream ].
	aStream nextPutAll: self description
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> process: aProcess [
	process := aProcess
]

{ #category : 'other' }
SpkDebuggerFrameTool >> receiveExecutionAnnouncement: anAnnouncement [
	"I should have already been updated by the time I receive this announcement."

	 self announce: anAnnouncement
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> receiver [
	^ currentState receiver
]

{ #category : 'post-refresh' }
SpkDebuggerFrameTool >> receiverHasChanged [
	"Only valid after first initialization and at least one refresh."

	^ currentState receiver ~~ previousState receiver
]

{ #category : 'other' }
SpkDebuggerFrameTool >> refreshAtLevel: aLevel [
	"Note that if the stack depth of the process has changed, aLevel
	will be different from the previous level. It's up to the sender
	to determine the correct new level."

	previousState := currentState.
	currentState := SpkProcessFrameInfo forProcess: process level: aLevel
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> source [
	"Return the source code of the associated method.
	If there is no method, empty string."

	^ currentState source
]

{ #category : 'other' }
SpkDebuggerFrameTool >> stepIntoAnnouncing: anAnnouncement [
	| level |
	level := currentState level.
	process _isTerminated
		ifFalse: [ process stepIntoFromLevel: level ].
	"Resume is required whether process is terminated or not."
	^ debuggerTool resumeAnnouncing: anAnnouncement
]

{ #category : 'other' }
SpkDebuggerFrameTool >> stepOverAnnouncing: anAnnouncement [

	| level |
	level := currentState level.
	process _isTerminated
		ifFalse: [ process stepOverFromLevel: level ].
	"Resume is required whether process is terminated or not."
	^debuggerTool resumeAnnouncing: anAnnouncement
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> stepPoint [
	^ currentState stepPoint
]

{ #category : 'post-refresh' }
SpkDebuggerFrameTool >> stepPointHasChanged [
	"Only valid after first initialization and at least one refresh."

	^ currentState stepPoint ~~ previousState stepPoint
]

{ #category : 'other' }
SpkDebuggerFrameTool >> stepThroughAnnouncing: anAnnouncement [
	| level |
	level := currentState level.
	process _isTerminated
		ifFalse: [ process stepThroughFromLevel: level ].
	"Resume is required whether process is terminated or not."
	^ debuggerTool resumeAnnouncing: anAnnouncement
]
