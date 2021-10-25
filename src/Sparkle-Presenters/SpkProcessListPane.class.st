Class {
	#name : 'SpkProcessListPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader + SpkTList',
	#classTraits : 'SpkTHeader classTrait + SpkTList classTrait',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkProcessListPane >> headerClass [

	^ SpkProcessListPaneHeader
]

{ #category : 'initialization' }
SpkProcessListPane >> initializeListColumns [

	self list
		addColumn: (SpStringTableColumn evaluated: [:item | item model name]);
		addColumn: (SpStringTableColumn evaluated: [:item | item model oop hex]);
		addColumn: (SpStringTableColumn evaluated: [:item | item model priority]);
		addColumn: (SpStringTableColumn evaluated: [:item | item model status])
]

{ #category : 'initialization' }
SpkProcessListPane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		initializeProcessList
]

{ #category : 'initialization' }
SpkProcessListPane >> initializeProcessList [

	self initializeList.
	self layout add: self list
]
