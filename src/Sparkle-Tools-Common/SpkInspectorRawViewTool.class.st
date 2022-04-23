Class {
	#name : 'SpkInspectorRawViewTool',
	#superclass : 'SpkInspectorFieldListViewTool',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'testing' }
SpkInspectorRawViewTool class >> canView: anObject [
	"Raw view is appropriate for all objects."

	^ true
]

{ #category : 'accessing' }
SpkInspectorRawViewTool >> indexedSize [

	^ SpkReflection indexedSizeOf: inspectedObject
]

{ #category : 'initialization' }
SpkInspectorRawViewTool >> initialize [

	super initialize.
	fieldTools := OrderedCollection new.
	numberOfColumns := 2 "name and self description"
]

{ #category : 'accessing' }
SpkInspectorRawViewTool >> instVarNames [

	| class |
	class := self classOfInspectedObject.
	^ class allInstVarNames
]

{ #category : 'accessing' }
SpkInspectorRawViewTool >> name [
	^ 'Raw'
]

{ #category : 'accessing' }
SpkInspectorRawViewTool >> namedSize [

	^ self instVarNames size
]

{ #category : 'accessing' }
SpkInspectorRawViewTool >> numberOfFields [

	^ self namedSize + self indexedSize
]

{ #category : 'accessing' }
SpkInspectorRawViewTool >> priority [
	"Answer my relative usefulness, as a Float, for viewing my inspectedObject."

	"Raw view is the universal view, but generally of lower priority than any other applicable views."

	^ 0.0
]

{ #category : 'refreshing' }
SpkInspectorRawViewTool >> refresh [

	self
		refreshFieldToolQuantity;
		refreshFieldToolContents
]

{ #category : 'refreshing' }
SpkInspectorRawViewTool >> refreshFieldToolContents [

	self
		refreshNamedFieldTools;
		refreshIndexedFieldTools
]

{ #category : 'refreshing' }
SpkInspectorRawViewTool >> refreshFieldToolQuantity [
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

{ #category : 'refreshing' }
SpkInspectorRawViewTool >> refreshIndexedFieldTools [

	1 to: self indexedSize do: [ :index | 
		| fieldTool referencedObject |
		fieldTool := fieldTools at: index + self namedSize.

		referencedObject := SpkReflection
			                    fetchIndexedInstvarAt: index
			                    from: inspectedObject.
		(fieldTool referencedObject == referencedObject)
			ifFalse:
				[fieldTool := self newFieldTool.
				fieldTools at: index + self namedSize put: fieldTool].
		fieldTool
			referencedObject: referencedObject;
			columnAt: 1 put: index printString;
			columnAt: 2 put: (self selfDescriptionOf: referencedObject) ]
]

{ #category : 'refreshing' }
SpkInspectorRawViewTool >> refreshNamedFieldTools [

	| names |
	names := self instVarNames.

	1 to: names size do: [ :index | 
		| fieldTool referencedObject |
		fieldTool := fieldTools at: index.
		referencedObject := SpkReflection
			                    fetchNamedInstvarAt: index
			                    from: inspectedObject.
		(fieldTool referencedObject == referencedObject)
			ifFalse:
				[fieldTool := self newFieldTool.
				fieldTools at: index put: fieldTool].
		fieldTool
			referencedObject: referencedObject;
			columnAt: 1 put: (names at: index);
			columnAt: 2 put: (self selfDescriptionOf: referencedObject) ]
]
