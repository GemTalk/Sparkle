Class {
	#name : 'SpkCompilationErrorServiceServer',
	#superclass : 'SpkCompilationErrorService',
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
}

{ #category : 'initialization' }
SpkCompilationErrorServiceServer >> initializeFromTool: aTool [

	errorLocation := aTool errorLocation.
	errorMessage := aTool errorMessage.
	sourceCode := aTool sourceCode
]
