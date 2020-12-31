Extension { #name : 'SpkCompilationErrorTool' }

{ #category : '*Sparkle-Tools-GemStone' }
SpkCompilationErrorTool >> initializeFrom: aCompileError [
	"Only report the first error detected."

	| errorDetails firstError |
	errorDetails := aCompileError errorDetails: nil.
	firstError := errorDetails at: 1.
	sourceCode := aCompileError sourceString.
	errorMessage := firstError at: 3.
	errorLocation := firstError at: 2
]
