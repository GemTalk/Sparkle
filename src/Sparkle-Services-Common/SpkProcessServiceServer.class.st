Class {
	#name : 'SpkProcessServiceServer',
	#superclass : 'SpkProcessService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'instance creaction' }
SpkProcessServiceServer class >> forTool: aProcessTool [

	^self new
		initializeFromTool: aProcessTool;
		yourself
]

{ #category : 'initialization' }
SpkProcessServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkProcessServiceServer >> refreshFromTool [

	name := tool name.
	oop := tool oop.
	priority := tool priority.
	stack := tool stack.
	status := tool status
]
