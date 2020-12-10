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
SpkInspectorTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ self classOf: inspectedObject
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

	"For Pharo, we substitute identityHash. 
	Pharo doesn't have a mirror for retrieving the identity hash, so we have to do it the careful way."

	^ self
		  carefullySend: #identityHash
		  ifNotUnderstood: [ "No actual object has an identityHash of zero" 
		  0 ]
]

{ #category : 'accessing' }
SpkInspectorTool >> selfDescription [

	^ self selfDescriptionOf: inspectedObject
]
