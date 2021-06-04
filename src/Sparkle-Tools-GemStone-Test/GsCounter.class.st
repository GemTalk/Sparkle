"
GsCounter is a first class replacement for idioms like:
| counter |
counter := Array with: 0.
...
counter at: 1 put: (counter at: 1) + 1

GsCounter currently counts integers and increments by one. 
It can easily be expanded to include decementing, arbitrary increments/decrements as well as non-integer values.
"
Class {
	#name : 'GsCounter',
	#superclass : 'Object',
	#instVars : [
		'current'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'instance creation' }
GsCounter class >> new [
	^ super new
		initialize;
		yourself
]

{ #category : 'accessing' }
GsCounter >> current [
	^ current
]

{ #category : 'updating' }
GsCounter >> increment [
	"Currently there is only a requirement to increment by 1. In future, this may need to support arbitrary increments."

	current := current + 1
]

{ #category : 'initializing - private' }
GsCounter >> initialize [
	super initialize.
	current := 0.
]
