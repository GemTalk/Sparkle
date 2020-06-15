Class {
	#name : 'SpkSmallStack',
	#superclass : 'Object',
	#instVars : [
		'elements',
		'limit'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkSmallStack class >> defaultLimit [
	^ 20
]

{ #category : 'instance creation' }
SpkSmallStack class >> new [
	^ self basicNew
		initializeForLimit: self defaultLimit;
		yourself
]

{ #category : 'accessing' }
SpkSmallStack >> collect: aBlock [
	^ elements reverse collect: aBlock
]

{ #category : 'private' }
SpkSmallStack >> enforceLimit [
	[ elements size > limit ] whileTrue: [ elements removeFirst ]
]

{ #category : 'initialization' }
SpkSmallStack >> initializeForLimit: maxElements [
	limit := maxElements.
	elements := OrderedCollection new: maxElements
]

{ #category : 'testing' }
SpkSmallStack >> isEmpty [
	^ elements isEmpty
]

{ #category : 'accessing' }
SpkSmallStack >> limit [
	^ limit
]

{ #category : 'accessing' }
SpkSmallStack >> limit: anObject [
	limit := anObject.
	self enforceLimit
]

{ #category : 'removing' }
SpkSmallStack >> pop [
	^ elements removeLast
]

{ #category : 'adding' }
SpkSmallStack >> push: anObject [
	elements addLast: anObject.
	self enforceLimit.
	^ anObject
]
