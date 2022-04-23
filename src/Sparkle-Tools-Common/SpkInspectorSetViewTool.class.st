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
	fieldTools := IdentitySet new.
	numberOfColumns := 1 "self description"
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
	| oldFieldTools addedObjects |
	oldFieldTools := fieldTools.
	addedObjects := inspectedObject copy.	"Remove any field tools for objects no longer in the set, and detect any added objects"
	fieldTools := oldFieldTools
		select: [ :fieldTool | 
			| referencedObject |
			referencedObject := fieldTool referencedObject.
			(inspectedObject includesIdentical: referencedObject)
				ifTrue: [ 
					addedObjects remove: referencedObject.
					true ]
				ifFalse: [ false ] ].	"Update content of remaining tools"
	fieldTools
		do: [ :each | each columnAt: 1 put: (self selfDescriptionOf: each referencedObject) ].	"Create a field tool for each object added to the set."
	addedObjects
		do: [ :each | 
			| fieldTool |
			fieldTool := self newFieldTool.
			fieldTool
				referencedObject: each;
				columnAt: 1 put: (self selfDescriptionOf: each).
			fieldTools add: fieldTool ]
]
