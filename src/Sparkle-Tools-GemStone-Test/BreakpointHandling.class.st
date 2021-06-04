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
BreakpointHandling >> nlr1 [

| dict |
self halt.
dict := KeyValueDictionary new.
dict
     at: #notPresent
     ifAbsent: [3 + 4. 
	^self].
^75
]

{ #category : 'other' }
BreakpointHandling >> nlr2 [
	| block |
	block := [ ^ 42 ].
	self halt.
	block value.
	^ 42 printString
]

{ #category : 'other' }
BreakpointHandling >> runHotForSeconds: anInteger
shouldHalt: shouldHalt
counter: aCounter [

	| endTime |
	endTime := DateAndTime now + (Duration seconds: anInteger).
	[ DateAndTime now < endTime ]
		whileTrue: [ 
			shouldHalt
				ifTrue: [ self halt ].
			"Processor yield."
			aCounter increment]
]
