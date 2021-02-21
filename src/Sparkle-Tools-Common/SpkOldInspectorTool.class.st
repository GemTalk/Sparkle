"
I inspect a single object.
I'm the Tool layer counterpart of an inspector pane in the presentation layer.
 
Internal Representation and Key Implementation Points.

**Instance Variables**
- explorerTool	<SpkExplorerTool>	The tool that handles undo/redo for me.
- fieldTools		<OrderedCollection of SpkInspectorFieldTool>	One per field of the inspected object
- inspectedObject	<any object>		The actual object being inspected.

    Implementation Points
- My inspectedObject may be anything, even a subclass of nil that understands no messages at all. I use reflection primitives wherever possible, to avoid sending messages to the inspected object. Operations that require sending a message to the object are only performed if the object understands that message.

"
Class {
	#name : 'SpkOldInspectorTool',
	#superclass : 'SpkInspectionTool',
	#instVars : [
		'fieldTools',
		'evaluatorTools'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkOldInspectorTool class >> on: anObject [

	^ self new
		  inspectedObject: anObject;
		  yourself
]

{ #category : 'initialization' }
SpkOldInspectorTool >> addEvaluator [

	^ evaluatorTools add: (SpkEvaluatorTool new
			   inspectorTool: self;
			   explorerTool: explorerTool;
			   taskspaceTool: taskspaceTool;
			   yourself)
]

{ #category : 'accessing' }
SpkOldInspectorTool >> classMembershipDescription [
	"Answer a string description of the object as an instance of its class"

	^ (SpkReflection isNonMetaclass: inspectedObject)
		ifTrue: [ 
			"inspectedObject is a class, and therefore should understand #name"
			inspectedObject name asString ]
		ifFalse: [ 
			| class title |
			class := self classOfInspectedObject.
			title := class name asString.
			(title first isVowel
				ifTrue: [ 'an ' ]
				ifFalse: [ 'a ' ]) , title ]
]

{ #category : 'private' }
SpkOldInspectorTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
]

{ #category : 'accessing' }
SpkOldInspectorTool >> evaluatorTools [

	^ evaluatorTools
]

{ #category : 'accessing' }
SpkOldInspectorTool >> explorerTool: aTool [

	super explorerTool: aTool.
	explorerTool addPane: self
]

{ #category : 'accessing' }
SpkOldInspectorTool >> fieldTools [

	^ fieldTools
]

{ #category : 'initialization' }
SpkOldInspectorTool >> initialize [

	super initialize.
	evaluatorTools := OrderedCollection new.
	fieldTools := OrderedCollection new
]

{ #category : 'initialization' }
SpkOldInspectorTool >> initializeForDefault [

	inspectedObject := nil.
	self addEvaluator
]

{ #category : 'instance creation' }
SpkOldInspectorTool >> newFieldTool [

	| fieldTool |
	fieldTool := SpkInspectorFieldTool new.
	fieldTool
		explorerTool: explorerTool;
		taskspaceTool: taskspaceTool;
		inspectedObject: inspectedObject.
	^ fieldTool
]

{ #category : 'as yet unclassified' }
SpkOldInspectorTool >> numberOfFields [

	| class namedSize indexedSize |
	class := self classOfInspectedObject.
	namedSize := class allInstVarNames size.

	indexedSize := SpkReflection indexedSizeOf: inspectedObject.
	^ namedSize + indexedSize
]

{ #category : 'accessing' }
SpkOldInspectorTool >> oop [

	"In Pharo, this is the identity hash, or 0 if #identityHash is not understood."

	^ SpkReflection identifierOf: inspectedObject
]

{ #category : 'as yet unclassified' }
SpkOldInspectorTool >> refreshFieldTools [

	| numberOfFields |
	numberOfFields := self numberOfFields.

	numberOfFields > fieldTools size ifTrue: [ 
		fieldTools size + 1 to: numberOfFields do: [ :i | 
			fieldTools add: (self newFieldTool
					 index: i;
					 yourself) ] ].

	numberOfFields < fieldTools size ifTrue: [ 
		fieldTools removeLast: fieldTools size - numberOfFields ].
	fieldTools do: [ :fieldTool | fieldTool refresh ]
]
