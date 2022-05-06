"
Show only the print strings of the contents of a set or set-like things.
If a Set subclass has ""extra"" instvars, these are not shown; use the raw view for that.
"
Class {
	#name : 'SpkInspectorSetViewTool',
	#superclass : 'SpkInspectorFieldListViewTool',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'testing' }
SpkInspectorSetViewTool class >> canView: anObject [
	| classOfObject |
	classOfObject := SpkReflection classOf: anObject.
	^ classOfObject == Set | (classOfObject == IdentitySet)
		| (classOfObject inheritsFrom: Set)
		| (classOfObject inheritsFrom: IdentitySet)
]

{ #category : 'initialization' }
SpkInspectorSetViewTool >> initialize [

	super initialize.
	self initializeFieldTools.
	numberOfColumns := 1 "self description"
]

{ #category : 'initialization' }
SpkInspectorSetViewTool >> initializeFieldTools [
	fieldTools := IdentityDictionary new
]

{ #category : 'accessing' }
SpkInspectorSetViewTool >> name [
	^ 'Set'
]

{ #category : 'accessing' }
SpkInspectorSetViewTool >> numberOfFields [
	^ inspectedObject size
]

{ #category : 'accessing' }
SpkInspectorSetViewTool >> priority [
	"Answer my relative usefulness, as a Float, for viewing my inspectedObject."

	"Set view should be the default for Set-like collections"

	^ 1.0
]

{ #category : 'refreshing' }
SpkInspectorSetViewTool >> refresh [
	| oldFieldTools |
	oldFieldTools := fieldTools.
	self initializeFieldTools.
	inspectedObject
		do: [ :each | 
			| fieldTool |
			fieldTool := oldFieldTools at: each ifAbsent: [ self newFieldToolFor: each ].
			fieldTool columnAt: 1 put: (self selfDescriptionOf: each).
			fieldTools at: each put: fieldTool ]
]
