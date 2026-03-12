Class {
	#name : 'SpkRuntimeErrorServiceServer',
	#superclass : 'SpkRuntimeErrorService',
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
}

{ #category : 'initialization' }
SpkRuntimeErrorServiceServer >> initializeFromTool: aTool [

	title := aTool title.
	stack := aTool stack
]
