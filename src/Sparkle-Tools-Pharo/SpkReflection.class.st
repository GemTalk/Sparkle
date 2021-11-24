"
Object reflection services for debugging tools,
with a common interface across GemStone and Pharo.

Debugging tools must not send any message to an object whose behavior is not well-known.
This class provides ways to determine the class of an object, and read and write its state,
without sending it any messages.
"
Class {
	#name : 'SpkReflection',
	#superclass : 'SpkObject',
	#instVars : [
		'announcer'
	],
	#category : 'Sparkle-Tools-Pharo-Support'
}

{ #category : 'messaging' }
SpkReflection class >> carefullySend: aSelector withArguments: argArray to: anObject ifNotUnderstood: notUnderstoodBlock onError: errorBlock [

	| class |
	class := self classOf: anObject.
	^ (class canUnderstand: aSelector)
		  ifTrue: [ 
			  [thisContext
				  object: anObject
				  perform: aSelector
				  withArguments: argArray
				  inClass: class]
						on: Error
						do: [:ex | ex return: errorBlock value]]
		  ifFalse: notUnderstoodBlock
]

{ #category : 'messaging' }
SpkReflection class >> carefullySend: aSelector withArguments: argArray to: anObject ifUnsuccessful: aBlock [
	^ self
		carefullySend: aSelector
		withArguments: argArray
		to: anObject
		ifNotUnderstood: aBlock
		onError: aBlock
]

{ #category : 'querying' }
SpkReflection class >> classOf: anObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ thisContext objectClass: anObject
]

{ #category : 'reading' }
SpkReflection class >> fetchIndexedInstvarAt: index from: anObject [

	^ thisContext object: anObject basicAt: index
]

{ #category : 'reading' }
SpkReflection class >> fetchNamedInstvarAt: index from: anObject [

	^ thisContext object: anObject instVarAt: index
]

{ #category : 'querying' }
SpkReflection class >> identifierOf: anObject [

	"In GemStone, identifier is the oop, and it is unique."

	^ self
		  carefullySend: #identityHash
		  withArguments: #(  )
		  to: anObject
		  ifUnsuccessful: [ "No actual object has an identityHash of zero" 
		  0 ]
]

{ #category : 'querying' }
SpkReflection class >> indexedSizeOf: anObject [

	^ thisContext objectSize: anObject
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

	| class |
	class := self classOf: anObject.
	^ class allInstVarNames size
]
