Class {
	#name : 'SpkConnectionListPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionList',
		'toolbar',
		'bigBox',
		'connectionsBox',
		'filterInput',
		'insecureConnectionPresenter',
		'connectionsNotebook',
		'addConnectionsBox',
		'addButton',
		'removeButton',
		'saveButton',
		'cancelButton',
		'connectButton',
		'disconnectButton',
		'gciConnectionPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkConnectionListPresenter >> activeConnectionPage [

	^ connectionsNotebook selectedPage activePresenter
]

{ #category : 'actions' }
SpkConnectionListPresenter >> add [

	self activeConnectionPage add
]

{ #category : 'actions' }
SpkConnectionListPresenter >> cancel [

	self activeConnectionPage cancel
]

{ #category : 'actions' }
SpkConnectionListPresenter >> connect [

	connectionList selection selectedItems do: [ :connectionProfile | 
		| connection |
		connection := connectionProfile connect.
		self openExplorer: connection ].
	self update
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> connectPresenters [

	super connectPresenters.
	connectButton whenActivatedDo: [ self enableButtons ].
	disconnectButton whenActivatedDo: [ self enableButtons ].
	connectionList whenSelectionChangedDo: [ :selection | 
		self enableButtons.
		selection selectedItems size > 1
			ifTrue: [ self initializeConnectionProfileTabs ]
			ifFalse: [ 
				selection selectedItem
					ifNil: [ self initializeConnectionProfileTabs ]
					ifNotNil: [ :connectionProfile | 
					self setConnectionProfile: connectionProfile ] ] ]
]

{ #category : 'actions' }
SpkConnectionListPresenter >> disconnect [

	connectionList selection selectedItems do: [ :connectionProfile | 
		connectionProfile disconnect ].
	self update.
]

{ #category : 'actions' }
SpkConnectionListPresenter >> enableButtons [

	connectionList selection selectedItems size = 1
		ifTrue: [ 
			connectButton enabled: self selectedConnection isNil.
			disconnectButton enabled: self selectedConnection isNil not ]
		ifFalse: [ 
			connectButton enabled: false.
			disconnectButton enabled: false ]
]

{ #category : 'actions' }
SpkConnectionListPresenter >> filterConnections [

	filterInput text = $# asString ifTrue: [ 
		^connectionList items:
			(SparkleConnectionProfile profiles select: [ :profile | 
				 profile group = String new ]) ].
	connectionList items:
		(SparkleConnectionProfile profiles select: [ :profile | 
			 | ws |
			 ws := (WriteStream on: String new)
				       nextPutAll: filterInput text;
				       nextPut: $*;
				       yourself.
			 ws contents match: profile group ])
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initialize [

	super initialize.
	SparkleConnectionProfile profileAnnouncer
		when: SpkConnectionProfileAddedAnnouncement
		send: #profileAdded:
		to: self.
	SparkleConnectionProfile profileAnnouncer
		when: SpkConnectionProfileRemovedAnnouncement
		send: #profileRemoved:
		to: self.
	SparkleConnectionProfile profileAnnouncer
		when: SpkConnectionProfileChangedAnnouncement
		send: #profileChanged:
		to: self
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializeButtons [

	addButton := self newButton
		             label: 'Add';
		             action: [ self add ].
	removeButton := self newButton
		                label: 'Remove';
		                action: [ self remove ].
	saveButton := self newButton
		              label: 'Save';
		              action: [ self save ].
	cancelButton := self newButton
		                label: 'Cancel';
		                action: [ self cancel ].
	connectButton := self newButton
		                 label: 'Connect';
		                 action: [ self connect ].
	disconnectButton := self newButton
		                    label: 'Disconnect';
		                    action: [ self disconnect ].
	addConnectionsBox add: (SpkBoxLayout newHorizontal beHomogeneous
			 add: addButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: removeButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: saveButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: cancelButton
			 withConstraints: [ :constraints | constraints height: 30 ]).

	addConnectionsBox
		add: (SpkBoxLayout newHorizontal beHomogeneous
				 add: connectButton
				 withConstraints: [ :constraints | constraints height: 30 ];
				 add: disconnectButton
				 withConstraints: [ :constraints | constraints height: 30 ])
		withConstraints: [ :constraints | constraints height: 40 ].
	self enableButtons
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializeConnectionList [

	connectionsBox add: (SpkBoxLayout newVertical
			 add: (self newLabel label: 'Connection Profiles')
			 withConstraints: [ :constraints | constraints height: 25 ];
			 add: (connectionList := self newTable
					                    sortingBlock: [ :a :b | a name < b name ];
					                    addColumn: (SpImageTableColumn new
							                     width: 25;
							                     evaluated: [ :profile | 
								                     profile connection
									                     ifNil: [  ]
									                     ifNotNil: [ self iconNamed: #smallOk ] ]);
					                    addColumn: (SpStringTableColumn new
							                     title: 'Name';
							                     sortFunction: #name ascending;
							                     width: 100;
							                     evaluated: #name);
					                    addColumn: (SpStringTableColumn new
							                     title: 'Group';
							                     width: 100;
							                     sortFunction: #group ascending;
							                     evaluated: #group);
					                    addColumn: (SpStringTableColumn new
							                     title: 'Details';
							                     evaluated: #displayString;
							                     sortFunction: #displayString ascending);
					                    items: OrderedCollection new;
					                    yourself);
			 yourself).
	connectionList items: SparkleConnectionProfile profiles.
	^ connectionList
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializeConnectionPresenterTabs [

	addConnectionsBox := SpkBoxLayout newVertical.
	connectionsNotebook := self newNotebook.
	addConnectionsBox
		add: connectionsNotebook
		withConstraints: [ :constraints | 
			constraints
				width: 225;
				height: 275 ].
	connectionsNotebook addPage:
		(SpNotebookPage title: 'GCI' icon: nil provider: [ 
			 gciConnectionPresenter := self instantiate:
				                           SpkGciConnectionPresenter ]).

	connectionsNotebook addPage:
		(SpNotebookPage title: 'Insecure' icon: nil provider: [ 
			 insecureConnectionPresenter := self instantiate:
				                                SpkInsecureConnectionPresenter ]).


	bigBox add: addConnectionsBox
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializeConnectionProfileTabs [

	insecureConnectionPresenter ifNotNil: [ :presenter | 
		presenter initializeConnectionProfile ].
	gciConnectionPresenter ifNotNil: [ :presenter | 
		presenter initializeConnectionProfile ]
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializeGroupFilter [

	filterInput := self newTextInput
		               whenTextChangedDo: [ self filterConnections ];
		               autoAccept: true;
		               placeholder: 'Enter # to show empty group names only';
		               yourself.
	connectionsBox
		add: (self instantiate: (SpLabelledPresenter
					  label: 'Group Filter:'
					  input: filterInput
					  description: String new))
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializePresenters [

	super initializePresenters.
	bigBox := SpkBoxLayout newHorizontal.
	self layout add: bigBox.
	connectionsBox := SpkBoxLayout newVertical.
	addConnectionsBox := SpkBoxLayout newVertical.
	bigBox
		add: connectionsBox
		withConstraints: [ :constraints | constraints width: 500 ].
	self initializeConnectionList.
	self initializeGroupFilter.
	self initializeConnectionPresenterTabs.
	self initializeButtons 
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Connections Launcher';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 750 @ 400;
		whenClosedDo: [ 
			SparkleConnectionProfile profileAnnouncer unsubscribe: self ]
]

{ #category : 'accessing' }
SpkConnectionListPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkConnectionListPresenter >> openExplorer: connection [

	| taskspace |
	taskspace := SparkleTaskspace new.
	taskspace
		connection: connection;
		openNewDefaultTaskspace
]

{ #category : 'events' }
SpkConnectionListPresenter >> profileAdded: announcement [

	"for now, assume only one profile can be added at a time"

	| profile |
	profile := announcement profiles first.
	connectionList items: connectionList items , (Array with: profile).
	connectionList selectItem: profile
]

{ #category : 'events' }
SpkConnectionListPresenter >> profileChanged: announcement [

	| profile |
	profile := announcement profiles first.
	connectionList selection selectedItem ifNotNil: [ :item | 
		connectionList items: (connectionList items copyWithout: item).
		connectionList items: connectionList items, (Array with: profile).
		connectionList selectItem: profile ]
]

{ #category : 'events' }
SpkConnectionListPresenter >> profileRemoved: announcement [

	connectionList items:
		(connectionList items copyWithoutAll: announcement profiles)
]

{ #category : 'actions' }
SpkConnectionListPresenter >> remove [

	self removeProfiles. 
	self activeConnectionPage remove
]

{ #category : 'actions' }
SpkConnectionListPresenter >> removeProfiles [

	(self confirm: 'Really remove profiles?') ifFalse: [ ^ self ].
	SparkleConnectionProfile removeProfiles:
		connectionList selection selectedItems
]

{ #category : 'actions' }
SpkConnectionListPresenter >> save [

	self activeConnectionPage save
]

{ #category : 'accessing' }
SpkConnectionListPresenter >> selectedConnection [

	^ connectionList selection selectedItem connection
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> setConnectionProfile: connectionProfile [

	connectionProfile isGciProfile
		ifTrue: [ 
		connectionsNotebook selectPageIndex: 1 "need to fix. Avoid constant" ]
		ifFalse: [ 
		connectionsNotebook selectPageIndex: 2 "need to fix. Avoid constant" ].
	^ self activeConnectionPage setConnectionProfile:
		  connectionProfile copy
]
