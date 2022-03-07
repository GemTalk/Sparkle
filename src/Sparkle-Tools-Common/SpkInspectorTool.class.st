Class {
	#name : 'SpkInspectorTool',
	#superclass : 'SpkPaneTool',
	#instVars : [
		'evaluatorTools',
		'views',
		'inspectedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'not comparing' }
SpkInspectorTool >> = anObject [
	"Diagnostic -- do we compare these objects?"

	self halt
]

{ #category : 'actions' }
SpkInspectorTool >> addEvaluator [
	"Sent from client"

	^ evaluatorTools
		add:
			(SpkEvaluatorTool new
				inspectorTool: self;
				explorerTool: explorerTool;
				taskspaceTool: taskspaceTool;
				yourself)
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
SpkInspectorTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
]

{ #category : 'accessing' }
SpkInspectorTool >> evaluatorTools [

	^ evaluatorTools
]

{ #category : 'accessing' }
SpkInspectorTool >> explorerTool [

	^ explorerTool
]

{ #category : 'accessing' }
SpkInspectorTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkInspectorTool >> initialize [

	super initialize.
	evaluatorTools := OrderedCollection new.
	views := OrderedCollection new
]

{ #category : 'initialization' }
SpkInspectorTool >> initializeInExplorer: xTool [
	super initializeInExplorer: xTool.
	self initializeViews
]

{ #category : 'initialization' }
SpkInspectorTool >> initializeViews [

	"only raw view, for now"

	| rawView |
	rawView := SpkInspectorRawViewTool on: inspectedObject.
	rawView
		taskspaceTool: taskspaceTool;
		refreshFieldTools.
	views add: rawView
]

{ #category : 'accessing' }
SpkInspectorTool >> inspectedObject [

	^ inspectedObject
]

{ #category : 'accessing' }
SpkInspectorTool >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : 'accessing' }
SpkInspectorTool >> oop [

	"In Pharo, this is the identity hash, or 0 if #identityHash is not understood."

	^ SpkReflection identifierOf: inspectedObject
]

{ #category : 'announcements' }
SpkInspectorTool >> receiveExecutionAnnouncement: anAnnouncement [
	self announce: anAnnouncement
]

{ #category : 'accessing' }
SpkInspectorTool >> selfDescription [

	"Answer a string showing how the inspected object describes itself using printOn:.
        Objects that do not understand #printOn: will answer the empty string.
        Limit output size in case of very long or infinitely recursive implementation of #printOn:,
        but set a high limit."

	^ self selfDescriptionOf: inspectedObject
]

{ #category : 'initialization' }
SpkInspectorTool >> taskspaceTool: aTool [

	super taskspaceTool: aTool.
	taskspaceTool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement: 
		to: self
]

{ #category : 'accessing' }
SpkInspectorTool >> views [

	^views
]
