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
	#instVars : [
		'elements'
	],
	#category : 'Sparkle-Spextensions-Layouts'
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

{ #category : 'accessing' }
SpkOrderedDictionary >> associationAt: aPresenter [

	^ self
		  associationAt: aPresenter
		  ifAbsent: [ self error: 'Presenter not found' ]
]

{ #category : 'accessing' }
SpkOrderedDictionary >> associationAt: aPresenter ifAbsent: aBlock [

	^ elements detect: [ :each | each key == aPresenter ] ifNone: aBlock
]

{ #category : 'accessing' }
SpkOrderedDictionary >> at: aPresenter [

	^ (self associationAt: aPresenter) value
]

{ #category : 'accessing' }
SpkOrderedDictionary >> at: aKey put: aValue [

	"If I include aKey, replace the value keeping the key's position in my order.
	If aKey is new, append it."

	| association |
	association := self associationAt: aKey ifAbsent: [ 
		               elements add: aKey -> aValue.
		               ^ aValue ].
	association value: aValue.
	^ aValue
]

{ #category : 'enumerating' }
SpkOrderedDictionary >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	elements do: [ :each | each value ]
]

{ #category : 'private' }
SpkOrderedDictionary >> errorKeyNotFound: aKey [

	KeyNotFound signalFor: aKey
]

{ #category : 'accessing' }
SpkOrderedDictionary >> identityIndexOfKey: aKey ifAbsent: absentBlock [

	1 to: elements size do: [ :i | 
	(elements at: i) key == aKey ifTrue: [ ^ i ] ].
	^ absentBlock value
]

{ #category : 'testing' }
SpkOrderedDictionary >> includesKey: aPresenter [

	self associationAt: aPresenter ifAbsent: [ ^ false ].
	^ true
]

{ #category : 'initialization' }
SpkOrderedDictionary >> initializeWithCapacity: anInteger [
	elements := OrderedCollection new: anInteger
]

{ #category : 'enumerating' }
SpkOrderedDictionary >> keys [

	^ elements collect: [ :each | each key ]
]

{ #category : 'enumerating' }
SpkOrderedDictionary >> keysAndValuesDo: aBlock [
	^ elements do: [ :each | aBlock value: each key value: each value ]
]

{ #category : 'removing' }
SpkOrderedDictionary >> removeAtIndex: anInteger [
	^ elements removeAt: anInteger
]

{ #category : 'removing' }
SpkOrderedDictionary >> removeKey: key [

	"Remove key from the receiver.
	If key is not in the receiver, notify an error."

	^ self removeKey: key ifAbsent: [ self errorKeyNotFound: key ]
]

{ #category : 'removing' }
SpkOrderedDictionary >> removeKey: aKey ifAbsent: anExceptionBlock [
	"Remove the association with the given key (by identity) the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	| index |
	index := self
		         identityIndexOfKey: aKey
		         ifAbsent: [ ^ anExceptionBlock value ].
	^ elements removeAt: index
]

{ #category : 'accessing' }
SpkOrderedDictionary >> size [
	^ elements size
]
