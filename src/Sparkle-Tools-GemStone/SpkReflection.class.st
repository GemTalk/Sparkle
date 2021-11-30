"
Object reflection services for debugging tools,
with a common interface across GemStone and Pharo.
"
Class {
	#name : 'SpkReflection',
	#superclass : 'SpkObject',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'messaging' }
SpkReflection class >> carefullySend: aSelector withArguments: argArray to: anObject ifNotUnderstood: notUnderstoodBlock onError: errorBlock [
	| class |
	class := self classOf: anObject.
	^ ((class canUnderstand: aSelector)
		and: [ class canUnderstand: #'perform:withArguments:' ])
		ifTrue: [ 
			[ anObject perform: aSelector withArguments: argArray ]
				on: Error
				do: errorBlock ]
		ifFalse: notUnderstoodBlock
]

{ #category : 'messaging' }
SpkReflection class >> carefullySend: aSelector withArguments: argArray to: anObject ifUnsuccessful: aBlock [
	^ self
		carefullySend: aSelector
		withArguments: argArray
		to: anObject
		ifNotUnderstood: aBlock
		onError: [:ex | ex return: aBlock value]
]

{ #category : 'querying' }
SpkReflection class >> classOf: anObject [
	^ Reflection classOf: anObject
]

{ #category : 'reading' }
SpkReflection class >> fetchIndexedInstvarAt: index from: anObject [
	^ Reflection fetchFrom: anObject at: index + (self namedSizeOf: anObject)
]

{ #category : 'reading' }
SpkReflection class >> fetchNamedInstvarAt: index from: anObject [
	^ Reflection fetchFrom: anObject at: index
]

{ #category : 'querying' }
SpkReflection class >> identifierOf: anObject [
	"In GemStone, identifier is the oop, and it is unique."

	^ Reflection oopOf: anObject
]

{ #category : 'querying' }
SpkReflection class >> indexedSizeOf: anObject [
	^ (Reflection sizeOf: anObject) - (self namedSizeOf: anObject)
]

{ #category : 'querying' }
SpkReflection class >> isNonMetaclass: anObject [
	"An object is a non-meta iff its class is a metaclass."

	| class |
	class := self classOf: anObject.
	^ class isMeta
]

{ #category : 'querying' }
SpkReflection class >> namedSizeOf: anObject [
	^ Reflection namedSizeOf: anObject
]
