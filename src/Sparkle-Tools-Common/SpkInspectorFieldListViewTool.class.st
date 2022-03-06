Class {
	#name : 'SpkInspectorFieldListViewTool',
	#superclass : 'SpkInspectionTool',
	#instVars : [
		'numberOfColumns',
		'fieldTools',
		'inspectedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkInspectorFieldListViewTool class >> on: anObject [

	^ self new
		  inspectedObject: anObject;
		  yourself
]

{ #category : 'private' }
SpkInspectorFieldListViewTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
]

{ #category : 'accessing' }
SpkInspectorFieldListViewTool >> fieldTools [

	^ fieldTools
]

{ #category : 'accessing' }
SpkInspectorFieldListViewTool >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : 'other' }
SpkInspectorFieldListViewTool >> name [
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
SpkInspectorFieldListViewTool >> newFieldTool [

	^ SpkInspectorFieldTool new
		  taskspaceTool: taskspaceTool;
		  numberOfColumns: numberOfColumns;
		  yourself
]

{ #category : 'as yet unclassified' }
SpkInspectorFieldListViewTool >> numberOfFields [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
SpkInspectorFieldListViewTool >> refreshFieldToolContents [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkInspectorFieldListViewTool >> refreshFieldToolQuantity [
	| numberOfFieldsInObject numberOfFieldsInView |
	numberOfFieldsInObject := self numberOfFields.
	numberOfFieldsInView := fieldTools size.
	numberOfFieldsInObject > numberOfFieldsInView
		ifTrue: [ 
			numberOfFieldsInObject - numberOfFieldsInView
				timesRepeat: [ fieldTools add: self newFieldTool ] ].
	numberOfFieldsInObject < numberOfFieldsInView
		ifTrue: [ 
			numberOfFieldsInView - numberOfFieldsInObject
				timesRepeat: [ fieldTools removeLast ] ]
]

{ #category : 'as yet unclassified' }
SpkInspectorFieldListViewTool >> refreshFieldTools [

	self
		refreshFieldToolQuantity;
		refreshFieldToolContents
]
