Class {
	#name : 'SpkDebuggerServiceServer',
	#superclass : 'SpkDebuggerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerServiceServer class >> forTool: aTool [

	^ self new
		  initializeFromTool: aTool;
		  yourself
]

{ #category : 'other' }
SpkDebuggerServiceServer >> initializeFramesFromTool [
	frames := tool frames
		collect: [ :frameTool | SpkDebuggerFrameServiceServer forTool: frameTool ]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshFromTool [

	exceptionDescription := tool exceptionDescription.
	self initializeFramesFromTool
]
