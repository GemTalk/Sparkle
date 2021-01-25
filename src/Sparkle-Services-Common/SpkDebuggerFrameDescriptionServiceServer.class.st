Class {
	#name : 'SpkDebuggerFrameDescriptionServiceServer',
	#superclass : 'SpkDebuggerFrameDescriptionService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerFrameDescriptionServiceServer class >> forTool: aTool [

	^ self new
		  initializeFromTool: aTool;
		  yourself
]

{ #category : 'other' }
SpkDebuggerFrameDescriptionServiceServer >> createFrameService [
	^ SpkDebuggerFrameServiceServer forTool: tool
]

{ #category : 'other' }
SpkDebuggerFrameDescriptionServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'other' }
SpkDebuggerFrameDescriptionServiceServer >> refreshFromTool [

	description := tool description.
	index := tool index
]
