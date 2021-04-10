Class {
	#name : 'SpkRuntimeErrorServiceServer',
	#superclass : 'SpkRuntimeErrorService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkRuntimeErrorServiceServer >> initializeFromTool: aTool [

	title := aTool title.
	stack := aTool stack
]
