Class {
	#name : 'SpkInspectorSetViewTool',
	#superclass : 'SpkInspectorFieldListViewTool',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'testing' }
SpkInspectorSetViewTool class >> canView: anObject [
	| classOfObject |
	classOfObject := SpkReflection classOf: anObject.
	^ (classOfObject inheritsFrom: Set)
		or: [ classOfObject inheritsFrom: IdentitySet ]
]

{ #category : 'accessing' }
SpkInspectorSetViewTool >> numberOfFields [
]
