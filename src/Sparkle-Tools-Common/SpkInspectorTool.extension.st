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
