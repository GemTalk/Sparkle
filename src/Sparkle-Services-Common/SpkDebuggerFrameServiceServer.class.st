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

{ #category : 'other' }
SpkDebuggerFrameServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'other' }
SpkDebuggerFrameServiceServer >> refreshFromTool [

	description := tool description.
	source := tool source
]
