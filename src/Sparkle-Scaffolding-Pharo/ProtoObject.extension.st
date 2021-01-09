Extension { #name : 'ProtoObject' }

{ #category : '*Sparkle-Scaffolding-Pharo' }
ProtoObject >> allInspectorNodes [

	^ #(  )
]

{ #category : '*Sparkle-Scaffolding-Pharo' }
ProtoObject >> inspectionContexts [

	"This is a utility method that collects all presentations for the current object.
	By default, it simply looks for the #gtInspectorPresentationOrder: pragma.
	The inspector can decice whether or not a presentation should be dispayed.
	Subclasses might want to override it for more special behavior."

	^ (StInspectionCollector on: self) collectInspectionContexts
]

{ #category : '*Sparkle-Scaffolding-Pharo' }
ProtoObject >> stDisplayString [

	^ 'a ProtoObject'
]
