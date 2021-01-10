Extension { #name : 'SpkDebuggerTool' }

{ #category : '*Sparkle-Tools-GemStone' }
SpkDebuggerTool class >> forException: anException inProcess: aGsProcess [
	"aGsProcess should not be the currently active process."

	^ self new
		initializeForException: anException process: aGsProcess;
		yourself
]
