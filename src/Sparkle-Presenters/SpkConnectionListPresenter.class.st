Class {
	#name : 'SpkConnectionListPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionList',
		'toolbar',
		'bigBox',
		'connectionsBox',
		'filterInput',
		'insecureConnectionBox',
		'insecureConnectionPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkConnectionListPresenter >> connect [

	
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> connectPresenters [

	super connectPresenters.
	connectionList whenSelectionChangedDo: [ :selection | 
		selection selectedItems size > 1
			ifTrue: [ insecureConnectionPresenter initializeConnectionProfile ]
			ifFalse: [ 
				selection selectedItem
					ifNil: [ insecureConnectionPresenter initializeConnectionProfile ]
					ifNotNil: [ :connectionProfile | 
						insecureConnectionPresenter setConnectionProfile: connectionProfile copy ] ] ]
]

{ #category : 'actions' }
SpkConnectionListPresenter >> disconnect [

	
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
SpkConnectionListPresenter >> initializeConnectionList [

	connectionsBox add: (SpkBoxLayout newVertical 
			 add: (self newLabel label: 'Connection Profiles')
			 withConstraints: [ :constraints | constraints height: 25 ];
			 add: (connectionList := self newTable
					                    sortingBlock: [ :a :b | a name < b name ];
					                    addColumn:
						                    (SpStringTableColumn
							                     title: 'Name'
							                     evaluated: #name);
					                    addColumn:
						                    (SpStringTableColumn
							                     title: 'Host'
							                     evaluated: #host);
					                    addColumn:
						                    (SpStringTableColumn
							                     title: 'Port'
							                     evaluated: #port);
					                    addColumn:
						                    (SpStringTableColumn
							                     title: 'Group'
							                     evaluated: #group);
					                    addColumn:
						                    (SpStringTableColumn
							                     title: 'In Memory'
							                     evaluated: #inMemory);
					                    items: OrderedCollection new;
					                    yourself);
			 yourself).
	connectionList items: SparkleConnectionProfile profiles.
	^ connectionList
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
SpkConnectionListPresenter >> initializeInsecureConnectionPresenter [

	| connectButton disconnectButton |
	insecureConnectionBox
		add: (insecureConnectionPresenter := self instantiate:
				                           SpkInsecureConnectionPresenter)
		withConstraints: [ :constraints | constraints width: 200 ].


	connectButton := self newButton
		                 label: 'Connect';
		                 action: [ self connect ].
	disconnectButton := self newButton
		                    label: 'Disconnect';
		                    action: [ self disconnect ].
	insecureConnectionBox add: (SpkBoxLayout newHorizontal beHomogeneous
			 add: connectButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: disconnectButton
			 withConstraints: [ :constraints | constraints height: 30 ]) withConstraints: [ :constraints | constraints height: 40 ]
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializePresenters [

	super initializePresenters.
	bigBox := SpkBoxLayout newHorizontal.
	self layout add: bigBox.
	connectionsBox := SpkBoxLayout newVertical.
	insecureConnectionBox := SpkBoxLayout newVertical.
	bigBox
		add: connectionsBox
		withConstraints: [ :constraints | constraints width: 500 ];
		add: insecureConnectionBox.
	self initializeConnectionList.
	self initializeGroupFilter.
	self initializeInsecureConnectionPresenter
]

{ #category : 'initialization' }
SpkConnectionListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Connections Launcher';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 750 @ 300;
		whenClosedDo: [ 
			SparkleConnectionProfile profileAnnouncer unsubscribe: self ]
]

{ #category : 'accessing' }
SpkConnectionListPresenter >> newLayout [

	^ SpkBoxLayout newVertical
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
SpkConnectionListPresenter >> removeProfiles [

	SparkleConnectionProfile removeProfiles:
		connectionList selection selectedItems
]
