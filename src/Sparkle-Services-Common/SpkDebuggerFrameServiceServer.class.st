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

{ #category : 'other' }
SpkDebuggerFrameServiceServer >> receiveExecutionAnnouncement: announcement [

	self refreshFromTool ifTrue: [ 
		announcement updatedServices add: self ]
]

{ #category : 'initialization' }
SpkDebuggerFrameServiceServer >> refreshFromTool [
	| changed oldValue currentSourceInterval  |
	changed := false.

	oldValue := description.
	description := tool description.
	changed := changed | (description ~= oldValue).

	oldValue := source.
	source := tool source.
	changed := changed | (source ~= oldValue).

	currentSourceInterval := tool currentSourceInterval.

	oldValue := currentStartPosition.
	currentStartPosition := currentSourceInterval first.
	changed := changed | (currentStartPosition ~= oldValue).

	oldValue := currentEndPosition.
	currentEndPosition := currentSourceInterval last.
	changed := changed | (currentEndPosition ~= oldValue).

	^ changed | self refreshLocalVariablesFromTool
]

{ #category : 'initialization' }
SpkDebuggerFrameServiceServer >> refreshLocalVariablesFromTool [
	localVariables := tool localVariables
		collect: [ :fieldTool | 
			SpkInspectorFieldServiceServer new
				parentService: self;
				initializeFromTool: fieldTool;
				yourself ].
	self flag: 'HACK!'.
	^ true
]

{ #category : 'other' }
SpkDebuggerFrameServiceServer >> tool [
	^ tool
]
