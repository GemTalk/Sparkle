Class {
	#name : 'SpkInspectorRawViewTool',
	#superclass : 'SpkInspectorViewTool',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'as yet unclassified' }
SpkInspectorRawViewTool >> indexedSize [

	^ SpkReflection indexedSizeOf: inspectedObject
]

{ #category : 'initialization' }
SpkInspectorRawViewTool >> initialize [

	super initialize.
	fieldTools := OrderedCollection new.
	numberOfColumns := 2 "name and self description"
]

{ #category : 'as yet unclassified' }
SpkInspectorRawViewTool >> instVarNames [

	| class |
	class := self classOfInspectedObject.
	^ class allInstVarNames
]

{ #category : 'as yet unclassified' }
SpkInspectorRawViewTool >> namedSize [

	^ self instVarNames size
]

{ #category : 'as yet unclassified' }
SpkInspectorRawViewTool >> numberOfFields [

	^ self namedSize + self indexedSize
]

{ #category : 'as yet unclassified' }
SpkInspectorRawViewTool >> refreshFieldToolContents [

	self
		refreshNamedFieldTools;
		refreshIndexedFieldTools
]

{ #category : 'as yet unclassified' }
SpkInspectorRawViewTool >> refreshIndexedFieldTools [

	1 to: self indexedSize do: [ :index | 
		| fieldTool |
		fieldTool := fieldTools at: index + self namedSize.
		fieldTool
			referencedObject:
				(SpkReflection fetchIndexedInstvarAt: index from: inspectedObject);
			columnAt: 1 put: index printString;
			columnAt: 2 put: (self selfDescriptionOf: inspectedObject) ]
]

{ #category : 'as yet unclassified' }
SpkInspectorRawViewTool >> refreshNamedFieldTools [

	| names |
	names := self instVarNames.

	1 to: names size do: [ :index | 
		| fieldTool |
		fieldTool := fieldTools at: index.
		fieldTool
			referencedObject:
				(SpkReflection fetchNamedInstvarAt: index from: inspectedObject);
			columnAt: 1 put: (names at: index);
			columnAt: 2 put: (self selfDescriptionOf: inspectedObject) ]
]
