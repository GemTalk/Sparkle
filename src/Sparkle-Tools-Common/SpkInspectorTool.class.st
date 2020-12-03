"
Inspects a single object.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : 'SpkInspectorTool',
	#superclass : 'Object',
	#instVars : [
		'inspectedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkInspectorTool class >> on: anObject [

	^ self new
		  inspectedObject: anObject;
		  yourself
]

{ #category : 'private' }
SpkInspectorTool >> carefullySend: aNilarySelector ifNotUnderstood: aBlock [

	^ self
		  carefullySend: aNilarySelector
		  withArguments: #(  )
		  ifNotUnderstood: aBlock
]

{ #category : 'private' }
SpkInspectorTool >> carefullySend: aSelector withArguments: argArray ifNotUnderstood: aBlock [

	^ self
		  carefullySend: aSelector
		  withArguments: argArray
		  to: inspectedObject
		  ifNotUnderstood: aBlock
]

{ #category : 'private' }
SpkInspectorTool >> carefullySend: aSelector withArguments: argArray to: anObject ifNotUnderstood: aBlock [

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

{ #category : 'accessing' }
SpkInspectorTool >> classMembershipDescription [

	"Answer a string description of the object as an instance of its class"

	| class |
	class := self classOfInspectedObject.
	^ (class isKindOf: Metaclass)
		  ifTrue: [ "inspectedObject is a class, and therefore should understand #name" 
			  inspectedObject name ]
		  ifFalse: [ 
			  | title |
			  title := class name.

			  (title first isVowel
				   ifTrue: [ 'an ' ]
				   ifFalse: [ 'a ' ]) , title ]
]

{ #category : 'private' }
SpkInspectorTool >> classOf: anObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ thisContext objectClass: anObject
]

{ #category : 'private' }
SpkInspectorTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ self classOf: inspectedObject
]

{ #category : 'private' }
SpkInspectorTool >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : 'accessing' }
SpkInspectorTool >> instVarsDo: aBinaryBlock [
	"Evaluate the block for each instance variable in the inspected object, 
	in order, named instvars first, followed by indexed.
	The two arguments to the block are the string name or string index of the instvar, 
	and the self-description of the object referenced by the instvar."
	
	
]

{ #category : 'accessing' }
SpkInspectorTool >> oop [

	"For Pharo, we substitute identityHash. 
	Pharo doesn't have a mirror for retrieving the identity hash, so we have to do it the careful way."

	^ self
		  carefullySend: #identityHash
		  ifNotUnderstood: [ "No actual object has an identityHash of zero" 
		  0 ]
]

{ #category : 'accessing' }
SpkInspectorTool >> selfDescription [

	"Answer a string showing how the object describes itself using printOn:.
	Objects that do not understand #printOn: will answer the empty string.
	Limit output size in case of very long or infinitely recursive implementation of #printOn:,
	but set a high limit."

	| stream |
	stream := LimitedWriteStream on: String new.
	stream
		limit: 250000;
		limitBlock: [ ^ stream contents ].
	self
		carefullySend: #printOn:
		withArguments: { stream }
		ifNotUnderstood: [  ].
	^ stream contents
]
