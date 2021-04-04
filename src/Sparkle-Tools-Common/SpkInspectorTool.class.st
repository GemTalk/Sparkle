Class {
	#name : 'SpkInspectorTool',
	#superclass : 'SpkInspectionTool',
	#instVars : [
		'evaluatorTools',
		'views',
		'currentView',
		'inspectedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'adding' }
SpkInspectorTool >> addEvaluator [

	^ evaluatorTools add: (SpkEvaluatorTool new
			   inspectorTool: self;
			   explorerTool: explorerTool;
			   taskspaceTool: taskspaceTool;
			   yourself)
]

{ #category : 'adding' }
SpkInspectorTool >> classMembershipDescription [
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

{ #category : 'adding' }
SpkInspectorTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
]

{ #category : 'as yet unclassified' }
SpkInspectorTool >> defaultView [

	^ views at: 'default'
]

{ #category : 'adding' }
SpkInspectorTool >> evaluatorTools [

	^ evaluatorTools
]

{ #category : 'accessing' }
SpkInspectorTool >> explorerTool [

	^ explorerTool
]

{ #category : 'accessing' }
SpkInspectorTool >> explorerTool: anObject [

	explorerTool := anObject.
	explorerTool addPane: self
]

{ #category : 'accessing' }
SpkInspectorTool >> fieldTools [

	^ currentView fieldTools
]

{ #category : 'accessing' }
SpkInspectorTool >> initialize [

	super initialize.
	evaluatorTools := OrderedCollection new.
	views := Dictionary new
]

{ #category : 'accessing' }
SpkInspectorTool >> initializeForDefault [

	self addEvaluator
]

{ #category : 'initialization' }
SpkInspectorTool >> initializeViews [

	"only raw view, for now"

	| rawView |
	rawView := SpkInspectorRawViewTool on: inspectedObject.
	rawView
		taskspaceTool: taskspaceTool;
		refreshFieldTools.
	views
		at: 'raw' put: rawView;
		at: 'default' put: rawView.
	currentView := rawView
]

{ #category : 'accessing' }
SpkInspectorTool >> inspectedObject [

	^ inspectedObject
]

{ #category : 'accessing' }
SpkInspectorTool >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : 'instance creation' }
SpkInspectorTool >> newInspectorToolOn: anObject [

	^ explorerTool newInspectorToolOn: anObject
]

{ #category : 'accessing' }
SpkInspectorTool >> oop [

	"In Pharo, this is the identity hash, or 0 if #identityHash is not understood."

	^ SpkReflection identifierOf: inspectedObject
]

{ #category : 'accessing' }
SpkInspectorTool >> receiveExecutionAnnouncement: anAnnouncement [

	self refreshFieldTools.
	self announce: anAnnouncement
]

{ #category : 'accessing' }
SpkInspectorTool >> refreshFieldTools [

	currentView refreshFieldTools
]

{ #category : 'accessing' }
SpkInspectorTool >> selfDescription [

	"Answer a string showing how the inspected object describes itself using printOn:.
        Objects that do not understand #printOn: will answer the empty string.
        Limit output size in case of very long or infinitely recursive implementation of #printOn:,
        but set a high limit."

	^ self selfDescriptionOf: inspectedObject
]

{ #category : 'accessing' }
SpkInspectorTool >> taskspaceTool: aTool [

	super taskspaceTool: aTool.
	taskspaceTool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement: 
		to: self
]
