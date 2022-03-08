Class {
	#name : 'SpkInspectorFieldListView',
	#superclass : 'SpkInspectorView',
	#traits : 'SpkTInspectableFieldList',
	#classTraits : 'SpkTInspectableFieldList classTrait',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkInspectorFieldListView >> initializeListColumns [

	list
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 1 ]);
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 2 ])
]

{ #category : 'initialization' }
SpkInspectorFieldListView >> refreshFromService [ 
	self halt.
]
