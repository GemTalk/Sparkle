"
Object reflection services for debugging tools,
with a common interface across GemStone and Pharo.
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
SpkReflection class >> carefullySend: aSelector withArguments: argArray to: anObject ifNotUnderstood: aBlock [

	| class |
	class := self classOf: anObject.
	^ (class canUnderstand: aSelector)
		  ifTrue: [ 
			  thisContext
				  object: anObject
				  perform: aSelector
				  withArguments: argArray
				  inClass: class ]
		  ifFalse: aBlock
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
		  ifNotUnderstood: [ "No actual object has an identityHash of zero" 
		  0 ]
]

{ #category : 'querying' }
SpkReflection class >> indexedSizeOf: anObject [

	^ thisContext objectSize: anObject
]

{ #category : 'querying' }
SpkReflection class >> namedSizeOf: anObject [

	| class |
	class := self classOf: anObject.
	^ class allInstVarNames size
]

{ #category : 'system info' }
SpkReflection class >> platformMetaclass [

	^ Metaclass
]
