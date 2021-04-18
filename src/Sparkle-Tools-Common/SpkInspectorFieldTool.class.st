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
SpkInspectorFieldTool >> _columns [
	"Private"
	^ columns
]

{ #category : 'comparing' }
SpkInspectorFieldTool >> = anObject [
	^ (super = anObject and: [ referencedObject == anObject referencedObject ])
		and: [ columns = anObject _columns ]
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> columnAt: anInteger [

	^ columns at: anInteger
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> columnAt: anInteger put: aString [

	columns at: anInteger put: aString
]

{ #category : 'comparing' }
SpkInspectorFieldTool >> hash [
	^ (super hash bitXor: referencedObject identityHash) bitXor: columns hash
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
