Class {
	#name : 'SpkInspectorFieldTool',
	#superclass : 'SpkInspectionTool',
	#instVars : [
		'columns',
		'referencedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkInspectorFieldTool >> columnAt: anInteger [

	^ columns at: anInteger
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> columnAt: anInteger put: aString [

	columns at: anInteger put: aString
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> numberOfColumns [

	^ columns size
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> numberOfColumns: anInteger [

	columns := Array new: anInteger
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> referencedObject [

	^ referencedObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> referencedObject: anObject [

	referencedObject := anObject
]
