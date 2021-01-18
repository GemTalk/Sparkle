Class {
	#name : 'SpkLimitedWriteStream',
	#superclass : 'WriteStreamPortable',
	#instVars : [
		'limit',
		'limitBlock'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkLimitedWriteStream class >> defaultLimit [
	^ 200000
]

{ #category : 'instance creation' }
SpkLimitedWriteStream class >> on: aCollection [
	^ (self basicNew on: aCollection)
		setLimit: self defaultLimit
		limitBlock: nil
]

{ #category : 'instance creation' }
SpkLimitedWriteStream class >> on: aCollection from: firstIndex to: lastIndex [
	^ (self basicNew on: aCollection from: firstIndex to: lastIndex)
		setLimit: self defaultLimit
		limitBlock: nil
]

{ #category : 'instance creation' }
SpkLimitedWriteStream class >> on: aCollection limit: anInteger limitBlock: aLimitBlock [
	^ (self basicNew on: aCollection)
		setLimit: anInteger
		limitBlock: aLimitBlock
]

{ #category : 'instance creation' }
SpkLimitedWriteStream class >> with: aCollection [
	^ (self basicNew with: aCollection)
		setLimit: self defaultLimit
		limitBlock: nil
]

{ #category : 'accessing' }
SpkLimitedWriteStream >> limit [
	^ limit
]

{ #category : 'accessing' }
SpkLimitedWriteStream >> limit: anInteger [
	limit := anInteger.

	position > limit
		ifTrue: [ 
			position := limit.
			limitBlock value ]
]

{ #category : 'accessing' }
SpkLimitedWriteStream >> limitBlock [
	^ limitBlock
]

{ #category : 'accessing' }
SpkLimitedWriteStream >> limitBlock: aBlock [
	limitBlock := aBlock
]

{ #category : 'accessing' }
SpkLimitedWriteStream >> nextPut: anObject [
	"Ensure that the limit is not exceeded"

	position >= limit
		ifTrue: [ limitBlock value ]
		ifFalse: [ super nextPut: anObject ].
	^ anObject
]

{ #category : 'accessing' }
SpkLimitedWriteStream >> nextPutAll: aCollection [
	| newEnd |
	newEnd := position + aCollection size.

	newEnd > limit
		ifTrue: [ 
			collection size: limit.
			^ self nextPutAllUntilLimit: aCollection ].

	newEnd > writeLimit
		ifTrue: [ collection size: newEnd ].

	collection
		replaceFrom: position + 1
		to: newEnd
		with: aCollection
		startingAt: 1.
	position := newEnd.

	^ aCollection
]

{ #category : 'private' }
SpkLimitedWriteStream >> nextPutAllUntilLimit: aCollection [
	"Write up to the limit, and one beyond, so that #nextPut: will invoke the limit block."

	aCollection
		do: [ :each | 
			| isLastOne |
			isLastOne := position >= limit.
			self nextPut: each.
			isLastOne
				ifTrue: [ ^ aCollection ] ]
]

{ #category : 'accessing' }
SpkLimitedWriteStream >> originalContents [
	"Answer the receiver's actual contents collection, NOT a copy."

	^ collection
]

{ #category : 'initialization' }
SpkLimitedWriteStream >> setLimit: anInteger limitBlock: aBlock [
	"Limit the numer of elements this stream will write..."
	limit := anInteger.

	"Execute this (typically ^ contents) when that limit is exceded"
	limitBlock := aBlock.

	"To support legacy users, this test must be here too"
	position > limit
		ifTrue: [
			position := limit.
			limitBlock value ]
]
