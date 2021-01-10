Extension { #name : 'SpkDebuggerTool' }

{ #category : '*Sparkle-Tools-GemStone' }
SpkDebuggerTool >> debugActionForContinue: aBlock [
	"I must restore this block as the debugAction of the debugged process before I let it continue.
	Typically this is the same block that caused me to be created."

	debugActionForContinue := aBlock
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkDebuggerTool >> exception: anException [
	"The exception that caused me to be invoked."

	exception := anException
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkDebuggerTool >> process: aProcess [
	"The GsProcess that I am to debug."

	process := aProcess
]
