"
This trait links RSR services in a hierarchical tree structure.
It can be applied to a template class when the hierarchy is to be replicated, or to the client and service subclasses if the hierarchy is not to be replicated.

When very many services are connected in a hierarchy tree, it can be a performance problem to link them together with replicated instance variables, as this will cause the entire tree to be marshaled and replicated at every message sent to any service's remoteSelf. In this case, the tree structure can be contained in non-replicated instvars provided by this trait, and when initializing the tree on the ""other side"" of the connection, a tree of SpkTransportService can be used.
"
Trait {
	#name : 'SpkTHierarchicalService',
	#instVars : [
		'parent',
		'children'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkTHierarchicalService >> children [

	^ children
]

{ #category : 'accessing' }
SpkTHierarchicalService >> children: anObject [

	children := anObject
]

{ #category : 'accessing' }
SpkTHierarchicalService >> parent [

	^ parent
]

{ #category : 'accessing' }
SpkTHierarchicalService >> parent: anObject [

	parent := anObject
]
