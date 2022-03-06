Class {
	#name : 'SpkDebuggerFrameServiceServer',
	#superclass : 'SpkDebuggerFrameService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerFrameServiceServer class >> forTool: aTool [

	^ self new
		  initializeFromTool: aTool;
		  yourself
]

{ #category : 'initialization' }
SpkDebuggerFrameServiceServer >> initializeFromTool: aTool [
	tool := aTool.
	tool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self.
	self refreshFromTool
]

{ #category : 'announcements' }
SpkDebuggerFrameServiceServer >> receiveExecutionAnnouncement: announcement [

	self refreshFromTool ifTrue: [ 
		announcement updatedServices add: self ]
]

{ #category : 'initialization' }
SpkDebuggerFrameServiceServer >> refreshFromTool [
	| changed oldValue currentSourceInterval |
	changed := false.

	oldValue := description.
	description := tool description.
	changed := changed | (description ~= oldValue).

	oldValue := source.
	source := tool source.
	changed := changed | (source ~= oldValue).

	currentSourceInterval := tool currentSourceInterval.

	oldValue := currentStartPosition.
	currentStartPosition := currentSourceInterval isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ currentSourceInterval first ].
	changed := changed | (currentStartPosition ~= oldValue).

	oldValue := currentEndPosition.
	currentEndPosition := currentSourceInterval isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ currentSourceInterval last ].
	changed := changed | (currentEndPosition ~= oldValue).

	oldValue := canStep.
	canStep := tool canStep.
	changed := changed | (canStep ~= oldValue).

	^ changed | self refreshLocalVariablesFromTool
]

{ #category : 'initialization' }
SpkDebuggerFrameServiceServer >> refreshLocalVariablesFromTool [
	| changed fieldTools numberOfServices numberOfTools |
	changed := false.
	fieldTools := tool localVariables.	"all of these field tools are newly-created from the process state."
	numberOfServices := localVariables size.
	numberOfTools := fieldTools size.
	numberOfServices < numberOfTools
		ifTrue: [ 
			changed := true.
			numberOfServices + 1 to: numberOfTools do: [ :i | 
				localVariables
					add:
						(SpkInspectorFieldServiceServer new
							parentService: self;
							tool: (fieldTools at: i);
							yourself) ] ].
	numberOfServices > numberOfTools
		ifTrue: [ 
			changed := true.
			localVariables size: numberOfTools ].
	1 to: numberOfTools do: [ :i | 
		| fieldTool fieldService newFieldService |
		fieldTool := fieldTools at: i.
		fieldService := localVariables at: i.	"
		Since fieldTool is newly-created, it will never be identical. Use equality comparison."
		fieldTool = fieldService tool
			ifFalse: [ 
				changed := true.
				newFieldService := SpkInspectorFieldServiceServer new
					parentService: self;
					tool: fieldTool;
					yourself.
				localVariables at: i put: newFieldService.
				fieldService := newFieldService ].
		changed := changed | fieldService refreshFromTool ].
	^ changed
]

{ #category : 'actions' }
SpkDebuggerFrameServiceServer >> restart [
	"Sent from client"

	tool
		restartAnnouncing: (SpkExecutionAnnouncement updatedServices: updatedServices).
	^ self
]

{ #category : 'actions' }
SpkDebuggerFrameServiceServer >> stepInto [
	"Sent from client"

	tool
		stepIntoAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ self
]

{ #category : 'actions' }
SpkDebuggerFrameServiceServer >> stepOver [
	"Sent from client"

	tool
		stepOverAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ self
]

{ #category : 'actions' }
SpkDebuggerFrameServiceServer >> stepThrough [
	"Sent from client"

	tool
		stepThroughAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ self
]

{ #category : 'accessing' }
SpkDebuggerFrameServiceServer >> tool [
	^ tool
]
