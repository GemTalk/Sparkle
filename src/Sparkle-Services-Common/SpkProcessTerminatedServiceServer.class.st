Class {
	#name : 'SpkProcessTerminatedServiceServer',
	#superclass : 'SpkProcessTerminatedService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
}

{ #category : 'other' }
SpkProcessTerminatedServiceServer >> initializeFromTool: aTool [
	tool := aTool.
	oop := SpkReflection identifierOf: tool process
]
