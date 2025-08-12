Extension { #name : 'SpkCompilationErrorTool' }

{ #category : '*Sparkle-Tools-Pharo' }
SpkCompilationErrorTool >> initializeFrom: aCodeError [

	sourceCode := aCodeError sourceCode.
	errorMessage := aCodeError messageText.
	errorLocation := aCodeError location
]
