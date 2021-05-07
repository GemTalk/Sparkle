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
SpkTestClassForDebugging >> factorialOf: factInt stopAt: stopInt [
	factInt = stopInt
		ifTrue: [ self halt ].
	factInt = 1
		ifTrue: [ ^ 1 ].
	^ factInt * (self factorialOf: factInt - 1 stopAt: stopInt)
]

{ #category : 'other' }
SpkTestClassForDebugging >> runHotForSeconds: anInteger
shouldHalt: shouldHalt
counter: counter [

	| endTime |
	endTime := DateAndTime now + (Duration seconds: anInteger).
	[ DateAndTime now < endTime ]
		whileTrue: [ 
			shouldHalt
				ifTrue: [ self halt ].
			"Processor yield."
			counter
				at: 1
				put: (counter first + 1)]
]

{ #category : 'breakpointing' }
SpkTestClassForDebugging >> twelve [
	^ 3 + 4 + 5
]
