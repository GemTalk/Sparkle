Class {
	#name : 'SpkProcessListServiceServer',
	#superclass : 'SpkProcessListService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'instance creation' }
SpkProcessListServiceServer class >> forTool: aProcessListTool [

	^self new
		initializeFromTool: aProcessListTool;
		yourself
]

{ #category : 'initialization' }
SpkProcessListServiceServer >> initializeFromTool: aProcessListTool [

	tool := aProcessListTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkProcessListServiceServer >> refreshFromTool [

	processes := tool processTools collect: [:each | SpkProcessService tool: each]
]
