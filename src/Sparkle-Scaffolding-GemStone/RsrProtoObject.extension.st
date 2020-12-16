Extension { #name : 'RsrProtoObject' }

{ #category : '*sparkle-scaffolding-gemstone' }
RsrProtoObject >> class [
	^ Reflection classOf: self
]

{ #category : '*sparkle-scaffolding-gemstone' }
RsrProtoObject >> asOop [
	^ Reflection oopOf: self
]

{ #category : '*sparkle-scaffolding-gemstone' }
RsrProtoObject >> asString [
	^ 'an RsrProtoObject'
]

{ #category : '*sparkle-scaffolding-gemstone' }
RsrProtoObject >> printString [
	^ self asString
]
