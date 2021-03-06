Class {
	#name : 'SpkDebuggerServiceServer',
	#superclass : 'SpkDebuggerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerServiceServer >> initializeFramesFromTool [

	frames := tool frames collect: [ :frameTool | 
		          (SpkDebuggerFrameDescriptionServiceServer forTool:
				           frameTool)
			          parentService: self;
			          yourself ]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self.
	self refreshFromTool
]

{ #category : 'other' }
SpkDebuggerServiceServer >> proceed [
	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	resultTool := tool proceedAnnouncing: announcement.
	^ resultTool == tool
		ifTrue: [ self ]
		ifFalse: [ SpkServiceFactory serviceForTool: resultTool ]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> receiveExecutionAnnouncement: announcement [

	self refreshFromTool ifTrue: [ 
		announcement updatedServices add: self ]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshExistingFrames [
	| numberOfValidFrames frameTools |
	numberOfValidFrames := 0.
	frameTools := tool nonGlueFrames.
	1 to: (frames size min: frameTools size) do: [ :index | 
		(frames at: index) tool == (frameTools at: index)
			ifFalse: [ ^ numberOfValidFrames ].
		numberOfValidFrames := numberOfValidFrames + 1 ].
	^ numberOfValidFrames
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshFramesFromTool [
	| changed numberOfValidFrames newStackDepth frameTools newFrames |
	changed := false.
	numberOfValidFrames := self refreshExistingFrames.
	changed := changed | (numberOfValidFrames ~= frames size).

	frameTools := tool nonGlueFrames.
	newStackDepth := frameTools size.
	newFrames := Array new: newStackDepth.
	changed := changed | (frames size ~= newStackDepth).

	newFrames
		replaceFrom: 1
		to: numberOfValidFrames
		with: frames
		startingAt: 1.

	numberOfValidFrames + 1 to: newStackDepth do: [ :index | 
		| frameTool |
		frameTool := frameTools at: index.
		newFrames
			at: index
			put:
				((SpkDebuggerFrameDescriptionServiceServer forTool: frameTool)
					parentService: self;
					yourself) ].
	frames := newFrames.
	^ changed
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshFromTool [
	tool replacementTool == tool
		ifTrue: [ ^ self refreshTopLevelInfoFromTool | self refreshFramesFromTool ].	"
	The debugger is being replaced by something else. 
	Pass that something else on."
	replacementService := SpkServiceFactory serviceForTool: tool replacementTool.
	^ true
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshTopLevelInfoFromTool [
	| changed oldValue |
	changed := false.

	oldValue := exceptionDescription.
	exceptionDescription := tool exceptionDescription.
	changed := changed | (exceptionDescription ~= oldValue).

	oldValue := processName.
	processName := tool processName.
	changed := changed | (processName ~= oldValue).

	oldValue := processIdentifier.
	processIdentifier := tool processIdentifier.
	changed := changed | (processIdentifier ~= oldValue).

	oldValue := processPriority.
	processPriority := tool processPriority.
	changed := changed | (processPriority ~= oldValue).

	^ changed
]

{ #category : 'other' }
SpkDebuggerServiceServer >> terminate [
	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	resultTool := tool terminateAnnouncing: announcement.
	^ resultTool == tool
		ifTrue: [ self ]
		ifFalse: [ SpkServiceFactory serviceForTool: resultTool ]
]
