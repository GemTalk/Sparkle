Extension { #name : 'SpkCompilationErrorTool' }

{ #category : '*Sparkle-Tools-Pharo' }
SpkCompilationErrorTool >> initializeFrom: aSyntaxErrorNotification [

	sourceCode := aSyntaxErrorNotification errorCode.
	errorMessage := aSyntaxErrorNotification errorMessage.
	errorLocation := aSyntaxErrorNotification location
]
