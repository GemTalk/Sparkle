Class {
	#name : 'SpkProcessListPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader + SpkTList',
	#classTraits : 'SpkTHeader classTrait + SpkTList classTrait',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkProcessListPane >> connectPresenters [

	super connectPresenters.
	model
		when: SpkPaneServiceAnnouncement
		send: #receivePaneServiceAnnouncement:
		to: self
]

{ #category : 'accessing' }
SpkProcessListPane >> headerClass [

	^ SpkProcessListPaneHeader
]

{ #category : 'initialization' }
SpkProcessListPane >> initializeListColumns [

	self list
		addColumn: (SpStringTableColumn evaluated: [:item | item model nameOrOopHex]);
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

{ #category : 'actions' }
SpkProcessListPane >> itemSelected: anAnnouncement [
	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| field inspectorService |
	field := anAnnouncement item.
	inspectorService := field model inspectFieldForRequest: field.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService
		ifNil: [ self disableAll ]
		ifNotNil: [ self openLinkedPane: inspectorService forItem: field ]
]

{ #category : 'updating' }
SpkProcessListPane >> updateFromModel [

	self
		refreshListModel;
		refreshList
]
