Class {
	#name : 'SpkConnectionsPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionList',
		'toolbar',
		'bigBox',
		'connectionsBox',
		'addConnectionBox',
		'addConnectionPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkConnectionsPresenter >> connectPresenters [

	super connectPresenters.
	connectionList whenSelectionChangedDo: [ :selection | 
		selection selectedItems size > 1
			ifTrue: [ addConnectionPresenter initializeConnectionProfile ]
			ifFalse: [ 
				selection selectedItem
					ifNil: [ addConnectionPresenter initializeConnectionProfile ]
					ifNotNil: [ :connectionProfile | 
						addConnectionPresenter setConnectionProfile: connectionProfile ] ] ]
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initialize [

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
SpkConnectionsPresenter >> initializeAddConnectionPresenter [

	addConnectionBox add: (addConnectionPresenter := self instantiate: SpkAddConnectionPresenter) withConstraints: [ :constraints | constraints width: 200 ]
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializeConnectionList [

	connectionsBox add: (SpkBoxLayout newVertical
			 add: (self newLabel label: 'Connection Profiles')
			 withConstraints: [ :constraints | constraints height: 20 ];
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
							                     title: 'In Memory'
							                     evaluated: #inMemory);
					                    items: OrderedCollection new;
					                    yourself);
			 yourself).
	connectionList items: SparkleConnectionProfile profiles.
	^ connectionList
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializePresenters [

	super initializePresenters.
	bigBox := SpkBoxLayout newHorizontal.
	self layout add: bigBox.
	connectionsBox := SpkBoxLayout newVertical.
	addConnectionBox := SpkBoxLayout newVertical.
	bigBox
		add: connectionsBox withConstraints: [:constraints | constraints width: 350];
		add: addConnectionBox.
	self initializeConnectionList.
	self initializeAddConnectionPresenter. 
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Connections Launcher';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 600 @ 300
]

{ #category : 'accessing' }
SpkConnectionsPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'events' }
SpkConnectionsPresenter >> profileAdded: announcement [

	connectionList items:
		connectionList items , (Array with: announcement profile)
]

{ #category : 'events' }
SpkConnectionsPresenter >> profileRemoved: announcement [

	connectionList items:
		(connectionList items copyWithout: announcement profile)
]
