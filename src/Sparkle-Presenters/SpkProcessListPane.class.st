Class {
	#name : 'SpkProcessListPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader + SpkTList',
	#classTraits : 'SpkTHeader classTrait + SpkTList classTrait',
	#instVars : [
		'toolbar'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkProcessListPane >> connectPresenters [

	super connectPresenters.
	self refreshListModel.
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
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item model nameOrOopHex ]);
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item model priority ]);
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item model status ]);
		addColumn:
			((SpkButtonTableColumn evaluated: [ :item | self iconNamed: #debug16 ])
				 width: 12;
				 action: [ :item | item model debugInNewExplorer ];
				 yourself)
]

{ #category : 'initialization' }
SpkProcessListPane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		initializeToolbar;
		addSeparator;
		initializeProcessList
]

{ #category : 'initialization' }
SpkProcessListPane >> initializeProcessList [

	self initializeList.
	self layout add: self list
]

{ #category : 'initialization' }
SpkProcessListPane >> initializeToolbar [

	toolbar := self instantiate: self toolbarClass on: self model.
	self layout
		add: toolbar
		withConstraints: [ :c | c height: toolbar toolbarHeight ]
]

{ #category : 'actions' }
SpkProcessListPane >> itemSelected: anAnnouncement [

	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| field inspectorService |
	field := anAnnouncement item.
	inspectorService := field model
		                    inspectFieldIn: self explorerService
		                    forRequest: field.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService ifNil: [ self disableAll ] ifNotNil: [ 
		field openLinkedPane: inspectorService.
		self refreshList ]
]

{ #category : 'updating' }
SpkProcessListPane >> refreshFromService [

	self refreshListModel
]

{ #category : 'accessing' }
SpkProcessListPane >> toolbarClass [

	^ SpkProcessListToolbar
]
