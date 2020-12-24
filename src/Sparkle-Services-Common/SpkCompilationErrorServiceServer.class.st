Class {
	#name : 'SpkCompilationErrorServiceServer',
	#superclass : 'SpkCompilationErrorService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'instance creation' }
SpkCompilationErrorServiceServer class >> forTool: aColumnLayoutTool [

	^ self new
		  initializeFromTool: aColumnLayoutTool;
		  yourself
]

{ #category : 'initialization' }
SpkCompilationErrorServiceServer >> initializeFromTool: aTool [

	errorLocation := aTool errorLocation.
	errorMessage := aTool errorMessage.
	sourceCode := aTool sourceCode
]
