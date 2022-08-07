Class {
	#name : 'SpkDebuggerServiceServer',
	#superclass : 'SpkDebuggerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkDebuggerServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self.
	self refreshFromTool
]

{ #category : 'private' }
SpkDebuggerServiceServer >> moveToExplorer: xServ [
	tool explorerTool: xServ tool.
	frames do: [ :each | each moveToExplorer: xServ ]
]

{ #category : 'actions' }
SpkDebuggerServiceServer >> moveToNewExplorer [
	"Create a new explorer in my taskspace, move myself
	and my linked panes (visible and invisible) to it, 
	and answer the new explorer service."

	| xTool xServ |
	xTool := tool newExplorerTool.
	xServ := SpkServiceFactory serviceForTool: xTool.
	self moveToExplorer: xServ.
	^ xServ
]

{ #category : 'actions' }
SpkDebuggerServiceServer >> proceed [
	"Sent from client"

	| resultTool |
	resultTool := tool
		proceedAnnouncing: (SpkExecutionAnnouncement updatedServices: updatedServices).
	^ resultTool == tool
		ifTrue: [ self ]
		ifFalse: [ SpkServiceFactory serviceForTool: resultTool ]
]

{ #category : 'announcements' }
SpkDebuggerServiceServer >> receiveExecutionAnnouncement: announcement [

	self refreshFromTool ifTrue: [ announcement addUpdatedService: self ]
]

{ #category : 'refreshing' }
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

{ #category : 'refreshing' }
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

{ #category : 'refreshing' }
SpkDebuggerServiceServer >> refreshFromTool [
	tool replacementTool == tool
		ifTrue: [ ^ self refreshTopLevelInfoFromTool | self refreshFramesFromTool ].	"
	The debugger is being replaced by something else. 
	Pass that something else on."
	replacementService := SpkServiceFactory serviceForTool: tool replacementTool.
	^ true
]

{ #category : 'refreshing' }
SpkDebuggerServiceServer >> refreshTopLevelInfoFromTool [
	| changed oldValue |
	changed := false.

	oldValue := exceptionDescription.
	exceptionDescription := tool whyDebugged.
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

{ #category : 'actions' }
SpkDebuggerServiceServer >> terminate [
	"Sent from client"

	| resultTool |
	resultTool := tool
		terminateAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ resultTool == tool
		ifTrue: [ self ]
		ifFalse: [ SpkServiceFactory serviceForTool: resultTool ]
]
