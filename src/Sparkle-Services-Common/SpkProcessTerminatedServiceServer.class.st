Class {
	#name : 'SpkProcessTerminatedServiceServer',
	#superclass : 'SpkProcessTerminatedService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkProcessTerminatedServiceServer >> initializeFromTool: aTool [
	tool := aTool.
	oop := SpkReflection identifierOf: tool process
]
