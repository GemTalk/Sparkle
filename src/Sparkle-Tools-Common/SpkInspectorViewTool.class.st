Class {
	#name : 'SpkInspectorViewTool',
	#superclass : 'SpkInspectionTool',
	#instVars : [
		'numberOfColumns',
		'fieldTools',
		'inspectedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkInspectorViewTool class >> on: anObject [

	^ self new
		  inspectedObject: anObject;
		  refreshFieldTools;
		  yourself
]

{ #category : 'private' }
SpkInspectorViewTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
]

{ #category : 'accessing' }
SpkInspectorViewTool >> fieldTools [

	^ fieldTools
]

{ #category : 'accessing' }
SpkInspectorViewTool >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : 'as yet unclassified' }
SpkInspectorViewTool >> newFieldTool [

	^ SpkInspectorFieldTool new
		  taskspaceTool: taskspaceTool;
		  numberOfColumns: numberOfColumns;
		  yourself
]

{ #category : 'as yet unclassified' }
SpkInspectorViewTool >> numberOfFields [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
SpkInspectorViewTool >> refreshFieldToolContents [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
SpkInspectorViewTool >> refreshFieldToolQuantity [

	| numberOfFields |
	numberOfFields := self numberOfFields.

	numberOfFields > fieldTools size ifTrue: [ 
		fieldTools size + 1 to: numberOfFields do: [ :i | 
			fieldTools add: (self newFieldTool
					 index: i;
					 yourself) ] ].

	numberOfFields < fieldTools size ifTrue: [ 
		fieldTools removeLast: fieldTools size - numberOfFields ]
]

{ #category : 'as yet unclassified' }
SpkInspectorViewTool >> refreshFieldTools [

	self
		refreshFieldToolQuantity;
		refreshFieldToolContents
]
