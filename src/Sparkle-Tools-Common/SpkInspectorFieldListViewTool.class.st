Class {
	#name : 'SpkInspectorFieldListViewTool',
	#superclass : 'SpkInspectorViewTool',
	#instVars : [
		'numberOfColumns',
		'fieldTools'
	],
	#category : 'Sparkle-Tools-Common'
}

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
SpkInspectorFieldListViewTool >> name [
	self subclassResponsibility
]

{ #category : 'private' }
SpkInspectorFieldListViewTool >> newFieldTool [

	^ SpkInspectorFieldTool new
		  taskspaceTool: taskspaceTool;
		  numberOfColumns: numberOfColumns;
		  yourself
]

{ #category : 'accessing' }
SpkInspectorFieldListViewTool >> numberOfFields [

	self subclassResponsibility
]
