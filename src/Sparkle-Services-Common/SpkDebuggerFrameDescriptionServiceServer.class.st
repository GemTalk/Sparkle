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

{ #category : 'obsolete' }
SpkDebuggerFrameDescriptionServiceServer >> createFrameService [
	self flag: 'Only sent by tests which should be rewritten.'.
	^ SpkDebuggerFrameServiceServer forTool: tool
]

{ #category : 'initializing' }
SpkDebuggerFrameDescriptionServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'private' }
SpkDebuggerFrameDescriptionServiceServer >> moveToExplorer: xServ [
]

{ #category : 'refreshing' }
SpkDebuggerFrameDescriptionServiceServer >> refreshFromTool [

	description := tool description.
	index := tool index
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionServiceServer >> tool [
	^tool
]
