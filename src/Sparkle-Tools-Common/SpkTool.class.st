"
General services needed by tool objects.
"
Class {
	#name : 'SpkTool',
	#superclass : 'Object',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'private' }
SpkTool >> carefullySend: aSelector withArguments: argArray to: anObject ifNotUnderstood: aBlock [

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

{ #category : 'private' }
SpkTool >> classOf: anObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ thisContext objectClass: anObject
]
