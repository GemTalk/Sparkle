"
Various methods for breakpointing, stepping, and the like by the debugger tool.
"
Class {
	#name : 'SpkTestClassForDebugging',
	#superclass : 'Object',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'breakpointing' }
SpkTestClassForDebugging >> twelve [
	^ 3 + 4 + 5

	"Despite having no obvious senders, this method is
	 referenced both in an explicit method lookup
	 and in evaluated strings.
	 Note that tests check for source intervals while stepping
	 so this comment follows the code."
]
