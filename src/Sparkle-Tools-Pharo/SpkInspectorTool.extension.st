Extension { #name : 'SpkInspectorTool' }

{ #category : '*sparkle-tools-pharo' }
SpkInspectorTool >> initializeIndexedInstvars [

	| size |
	size := thisContext objectSize: inspectedObject.
	1 to: size do: [ :index | 
		| value fieldTool |
		value := SpkReflection
			         fetchIndexedInstvarAt: index
			         from: inspectedObject.
		thisContext object: inspectedObject basicAt: index.
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
		value := SpkReflection
			         fetchNamedInstvarAt: index
			         from: inspectedObject.
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
	self flag:
		'Need to port LimitedWriteStream to GemStone and move this method to common.'.
	stream := LimitedWriteStream on: String new.
	stream
		limit: 250000;
		limitBlock: [ ^ stream contents ].
	SpkReflection
		carefullySend: #printOn:
		withArguments: { stream }
		to: anObject
		ifNotUnderstood: [  ].
	^ stream contents
]