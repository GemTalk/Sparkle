"
An ordered dictionary that supports insertion.
Uses linear search for lookup, so best for fairly small collections.

Implemented as an OrderedCollection of Associations.

Special protocol: 

add: anAssociation beforeIndex: anIndex ""index of 1 inserts at front, index of size + 1 appends""
"
Class {
	#name : 'SpkOrderedDictionary',
	#superclass : 'Collection',
	#classVars : [
		'elements'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'instance creation' }
SpkOrderedDictionary class >> new [
	^ self new: 10
]

{ #category : 'instance creation' }
SpkOrderedDictionary class >> new: anInteger [
	^ self basicNew initializeWithCapacity: anInteger
]

{ #category : 'adding' }
SpkOrderedDictionary >> add: anAssociation [ 
	"Include newObject as one of the receiver's elements. Answer newObject. 
	ArrayedCollections cannot respond to this message."

	^ elements add: anAssociation
]

{ #category : 'adding' }
SpkOrderedDictionary >> add: anAssociation beforeIndex: anIndex [
	"index of 1 inserts at front, index of size + 1 appends"

	elements add: anAssociation beforeIndex: anIndex
]

{ #category : 'enumerating' }
SpkOrderedDictionary >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	elements do: [ :each | each value ]
]

{ #category : 'accessing' }
SpkOrderedDictionary >> identityIndexOf: aKey ifAbsent: absentBlock [
	1 to: elements size do: [ :i | 
	(elements at: i) key == aKey ifTrue: [ ^ i ] ].
	^ absentBlock value
]

{ #category : 'initialization' }
SpkOrderedDictionary >> initializeWithCapacity: anInteger [
	elements := OrderedCollection new: anInteger
]

{ #category : 'removing' }
SpkOrderedDictionary >> remove: aKey ifAbsent: anExceptionBlock [
	"Remove the association with the given key (by identity) the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	| index |
	index := self
		         identityIndexOf: aKey
		         ifAbsent: [ ^ anExceptionBlock value ].
	^ elements removeAt: index
]

{ #category : 'accessing' }
SpkOrderedDictionary >> size [
	^ elements size
]
