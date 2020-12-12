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
	#name : 'SpkInspectorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'inspectedObject',
		'fieldTools',
		'evaluatorTools'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkInspectorTool class >> on: anObject [

	^ self new
		  inspectedObject: anObject;
		  yourself
]

{ #category : 'initialization' }
SpkInspectorTool >> addEvaluator [

	evaluatorTools add: (SpkEvaluatorTool new
			 inspectorTool: self;
			 explorerTool: explorerTool;
			 yourself)
]

{ #category : 'acccessing' }
SpkInspectorTool >> classMembershipDescription [

	"Answer a string description of the object as an instance of its class"

	| class |
	class := self classOfInspectedObject.
	^ (class isKindOf: SpkReflection platformMetaclass)
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
SpkInspectorTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
]

{ #category : 'accessing' }
SpkInspectorTool >> evaluatorTools [

	^ evaluatorTools
]

{ #category : 'accessing' }
SpkInspectorTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'accessing' }
SpkInspectorTool >> fieldTools [

	^ fieldTools ifNil: [ self initializeFieldTools ]
]

{ #category : 'initialization' }
SpkInspectorTool >> initialize [

	super initialize.
	evaluatorTools := OrderedCollection new
]

{ #category : 'private' }
SpkInspectorTool >> initializeFieldTools [

	"Must have set inspectedObject already"

	fieldTools := OrderedCollection new.
	self
		initializeNamedInstvars;
		initializeIndexedInstvars.
	^ fieldTools
]

{ #category : 'initialization' }
SpkInspectorTool >> initializeForDefault [

	inspectedObject := nil.
	self addEvaluator
]

{ #category : '*sparkle-tools-pharo' }
SpkInspectorTool >> initializeIndexedInstvars [

	| size |
	size := thisContext objectSize: inspectedObject.
	1 to: size do: [ :index | 
		| value fieldTool |
		value := SpkReflection
			         fetchIndexedInstvarAt: index
			         from: inspectedObject.
		thisContext object: inspectedObject basicAt: index.
		fieldTool := SpkInspectorIndexedInstvarTool new.
		fieldTool
			explorerTool: explorerTool;
			inspectorTool: self;
			index: index;
			name: index printString;
			selfDescription: (self selfDescriptionOf: value).
		fieldTools add: fieldTool ]
]

{ #category : '*sparkle-tools-pharo' }
SpkInspectorTool >> initializeNamedInstvars [

	| class names |
	class := self classOfInspectedObject.
	names := class allInstVarNames.
	1 to: names size do: [ :index | 
		| value fieldTool |
		value := SpkReflection
			         fetchNamedInstvarAt: index
			         from: inspectedObject.
		fieldTool := SpkInspectorNamedInstvarTool new.
		fieldTool
			explorerTool: explorerTool;
			inspectorTool: self;
			index: index;
			name: (names at: index);
			selfDescription: (self selfDescriptionOf: value).
		fieldTools add: fieldTool ]
]

{ #category : 'accessing' }
SpkInspectorTool >> inspectedObject [

	^ inspectedObject
]

{ #category : 'private' }
SpkInspectorTool >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : 'instance creation' }
SpkInspectorTool >> newEvaluator [

	^ SpkEvaluatorTool new
		  inspectorTool: self;
		  yourself
]

{ #category : 'accessing' }
SpkInspectorTool >> oop [

	"In Pharo, this is the identity hash, or 0 if #identityHash is not understood."

	^ SpkReflection identifierOf: inspectedObject
]

{ #category : 'accessing' }
SpkInspectorTool >> selfDescription [

	^ self selfDescriptionOf: inspectedObject
]
