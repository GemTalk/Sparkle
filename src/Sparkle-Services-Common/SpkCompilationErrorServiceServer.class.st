Class {
	#name : 'SpkCompilationErrorServiceServer',
	#superclass : 'SpkCompilationErrorService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkCompilationErrorServiceServer >> initializeFromTool: aTool [

	errorLocation := aTool errorLocation.
	errorMessage := aTool errorMessage.
	sourceCode := aTool sourceCode
]
