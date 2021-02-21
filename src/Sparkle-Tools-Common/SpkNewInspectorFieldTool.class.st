Class {
	#name : 'SpkNewInspectorFieldTool',
	#superclass : 'SpkTool',
	#instVars : [
		'columns',
		'referencedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkNewInspectorFieldTool >> columnAt: anInteger put: aString [

	columns at: anInteger put: aString
]

{ #category : 'accessing' }
SpkNewInspectorFieldTool >> numberOfColumns: anInteger [

	columns := Array new: anInteger
]

{ #category : 'accessing' }
SpkNewInspectorFieldTool >> referencedObject: anObject [

	referencedObject := anObject
]
