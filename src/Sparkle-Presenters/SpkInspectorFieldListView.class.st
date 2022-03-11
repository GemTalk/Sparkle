Class {
	#name : 'SpkInspectorFieldListView',
	#superclass : 'SpkInspectorView',
	#traits : 'SpkTInspectableFieldList',
	#classTraits : 'SpkTInspectableFieldList classTrait',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'refreshing' }
SpkInspectorFieldListView >> deselectChangedFields [

	self
		deselectOffTheEndFields;
		deselectIdentityChangedFields
]

{ #category : 'refreshing' }
SpkInspectorFieldListView >> deselectIdentityChangedFields [

	| oldFields newFields |
	oldFields := self listModel items.
	newFields := model fields.
	1 to: (newFields size min: oldFields size) do: [ :i | 
		| oldField newField |
		oldField := oldFields at: i.
		newField := newFields at: i.
		oldField model == newField ifFalse: [ 
			self listModel deselectItem: oldField ] ]
]

{ #category : 'refreshing' }
SpkInspectorFieldListView >> deselectOffTheEndFields [

	| newNumberOfFields |
	newNumberOfFields := model fields size.
	self listModel deselectItemsBeyondIndex: newNumberOfFields
]

{ #category : 'initialization' }
SpkInspectorFieldListView >> initializeListColumns [

	list
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 1 ]);
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 2 ])
]

{ #category : 'initialization' }
SpkInspectorFieldListView >> initializePresenters [

	self initializeList
]

{ #category : 'refreshing' }
SpkInspectorFieldListView >> labelString [

	^ self listItemServices size printString , ' fields'
]

{ #category : 'refreshing' }
SpkInspectorFieldListView >> refreshFromService [

	self deselectChangedFields
]
