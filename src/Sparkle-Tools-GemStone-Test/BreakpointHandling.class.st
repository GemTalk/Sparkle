"
Used by BreakpointHandlingTest
"
Class {
	#name : 'BreakpointHandling',
	#superclass : 'Object',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
BreakpointHandling >> factorialOf: factInt stopAt: stopInt [
	factInt = stopInt
		ifTrue: [ self halt ].
	factInt = 1
		ifTrue: [ ^ 1 ].
	^ factInt * (self factorialOf: factInt - 1 stopAt: stopInt)
]

{ #category : 'other' }
BreakpointHandling >> runHotForSeconds: anInteger
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
