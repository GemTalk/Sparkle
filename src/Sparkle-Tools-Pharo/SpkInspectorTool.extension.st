Extension { #name : 'SpkInspectorTool' }

{ #category : '*sparkle-tools-pharo' }
SpkInspectorTool >> classMembershipDescription [

	"Answer a string description of the object as an instance of its class"

	| class |
	class := self classOfInspectedObject.
	^ (class isKindOf: Metaclass)
		  ifTrue: [ "inspectedObject is a class, and therefore should understand #name" 
			  inspectedObject name ]
		  ifFalse: [ 
			  | title |
			  title := class name.

			  (title first isVowel
				   ifTrue: [ 'an ' ]
				   ifFalse: [ 'a ' ]) , title ]
]

{ #category : '*sparkle-tools-pharo' }
SpkInspectorTool >> initializeIndexedInstvars [

	| size |
	size := thisContext objectSize: inspectedObject.
	1 to: size do: [ :index | 
		| value fieldTool |
		value := thisContext object: inspectedObject basicAt: index.
		fieldTool := SpkInspectorIndexedInstvarTool new.
		fieldTool
			explorerTool: explorerTool;
			inspectorTool: self;
			index: index;
			name: index printString;
			selfDescription: (self selfDescriptionOf: value).
		fieldTools add: fieldTool ]
]

{ #category : '*sparkle-tools-pharo' }
SpkInspectorTool >> initializeNamedInstvars [

	| class names |
	class := self classOfInspectedObject.
	names := class allInstVarNames.
	1 to: names size do: [ :index | 
		| value fieldTool |
		value := thisContext object: inspectedObject instVarAt: index.
		fieldTool := SpkInspectorNamedInstvarTool new.
		fieldTool
			explorerTool: explorerTool;
			inspectorTool: self;
			index: index;
			name: (names at: index);
			selfDescription: (self selfDescriptionOf: value).
		fieldTools add: fieldTool ]
]

{ #category : '*sparkle-tools-pharo' }
SpkInspectorTool >> selfDescriptionOf: anObject [

	"Answer a string showing how the object describes itself using printOn:.
	Objects that do not understand #printOn: will answer the empty string.
	Limit output size in case of very long or infinitely recursive implementation of #printOn:,
	but set a high limit."

	| stream |
	stream := LimitedWriteStream on: String new.
	stream
		limit: 250000;
		limitBlock: [ ^ stream contents ].
	self
		carefullySend: #printOn:
		withArguments: { stream }
		to: anObject
		ifNotUnderstood: [  ].
	^ stream contents
]
