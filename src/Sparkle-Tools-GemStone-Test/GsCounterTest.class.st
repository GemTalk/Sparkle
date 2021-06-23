Class {
	#name : 'GsCounterTest',
	#superclass : 'TestCase',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'tests' }
GsCounterTest >> testIncrementing [

	| counter |
	counter := GsCounter new.
	counter increment.
	self assert: counter current equals: 1.
	counter increment.
	self assert: counter current equals: 2.
]

{ #category : 'tests' }
GsCounterTest >> testInstanceCreation [

	| counter |
	counter := GsCounter new.
	self assert: counter current equals: 0.
]
