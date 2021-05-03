"
Various methods for breakpointing, stepping, and the like by the debugger tool.
"
Class {
	#name : 'SpkTestClassForDebugging',
	#superclass : 'Object',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkTestClassForDebugging >> factorialOf: anInteger [
	anInteger = 1 ifTrue: [^ 1].
	^ anInteger * (self factorialOf: anInteger - 1)
]

{ #category : 'other' }
SpkTestClassForDebugging >> runHotForSeconds: anInteger shouldHalt: shouldHalt [
	| endTime |
	endTime := DateAndTime now + (Duration seconds: anInteger).
	[ DateAndTime now < endTime ]
		whileTrue: [ 
			shouldHalt
				ifTrue: [ self halt ].
			3 + 4 ]
]

{ #category : 'breakpointing' }
SpkTestClassForDebugging >> twelve [
	^ 3 + 4 + 5
]
