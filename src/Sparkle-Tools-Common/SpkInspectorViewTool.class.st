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

{ #category : 'other' }
SpkInspectorViewTool >> name [
	self subclassResponsibility
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

{ #category : 'accessing' }
SpkInspectorViewTool >> refreshFieldToolQuantity [
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
SpkInspectorViewTool >> refreshFieldTools [

	self
		refreshFieldToolQuantity;
		refreshFieldToolContents
]
