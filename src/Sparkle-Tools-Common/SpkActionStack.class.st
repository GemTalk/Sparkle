"
A stack of limited size. When the stack is full, pushing an element will discard the bottom-most stack element.

Designed to hold actions for an undo manager.

 
Internal Representation and Key Implementation Points.

    **Instance Variables**
*	elements:		<OrderedCollection> The elements on the stack. The last element is the top element.
*	limit:		<Integer> How many elements are allowed to accumulate on the stack before the deepest item is discarded.

When an element is to be discarded because of a #clear or reaching the size limit, it is sent #discardAction.
"
Class {
	#name : 'SpkActionStack',
	#superclass : 'SpkObject',
	#instVars : [
		'elements',
		'limit'
	],
	#category : 'Sparkle-Tools-Common',
	#package : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkActionStack class >> defaultLimit [
	^ 20
]

{ #category : 'instance creation' }
SpkActionStack class >> new [
	^ self basicNew
		initializeForLimit: self defaultLimit;
		yourself
]

{ #category : 'accessing' }
SpkActionStack >> clear [
	"GemStone does not implement #removeAll"

	elements removeAllSuchThat: [ :element |
		element discardAction.
		true ]
]

{ #category : 'accessing' }
SpkActionStack >> collect: aBlock [
	^ elements reverse collect: aBlock
]

{ #category : 'private' }
SpkActionStack >> enforceLimit [

	[ elements size > limit ] whileTrue: [
		elements removeFirst discardAction ]
]

{ #category : 'initialization' }
SpkActionStack >> initializeForLimit: maxElements [
	limit := maxElements.
	elements := OrderedCollection new: maxElements
]

{ #category : 'testing' }
SpkActionStack >> isEmpty [
	^ elements isEmpty
]

{ #category : 'testing' }
SpkActionStack >> isNotEmpty [
	^ elements isNotEmpty
]

{ #category : 'accessing' }
SpkActionStack >> limit [
	^ limit
]

{ #category : 'accessing' }
SpkActionStack >> limit: anObject [
	limit := anObject.
	self enforceLimit
]

{ #category : 'removing' }
SpkActionStack >> pop [
	^ elements removeLast
]

{ #category : 'adding' }
SpkActionStack >> push: anObject [
	elements addLast: anObject.
	self enforceLimit.
	^ anObject
]
