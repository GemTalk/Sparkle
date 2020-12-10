Extension { #name : 'SpkTool' }

{ #category : '*sparkle-tools-pharo' }
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

{ #category : '*sparkle-tools-pharo' }
SpkTool >> classOf: anObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ thisContext objectClass: anObject
]
