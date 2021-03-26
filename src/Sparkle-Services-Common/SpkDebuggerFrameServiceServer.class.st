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

{ #category : 'initialization' }
SpkDebuggerFrameServiceServer >> refreshFromTool [
	| currentSourceInterval |
	description := tool description.
	source := tool source.
	currentSourceInterval := tool currentSourceInterval.
	currentStartPosition := currentSourceInterval first.
	currentEndPosition := currentSourceInterval last.
	self refreshLocalVariablesFromTool
]

{ #category : 'initialization' }
SpkDebuggerFrameServiceServer >> refreshLocalVariablesFromTool [
	localVariables := tool localVariables
		collect: [ :fieldTool | 
			SpkInspectorFieldServiceServer new
				parentService: self;
				initializeFromTool: fieldTool;
				yourself ]
]

{ #category : 'other' }
SpkDebuggerFrameServiceServer >> tool [
	^ tool
]
