Class {
	#name : 'SpkConnectionsPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionList',
		'toolbar'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkConnectionsPresenter >> createNewConnection [

	"Why doesn't SpAbstractListPresenter have an addItem: api?"
	| newProfile |
	newProfile := SparkleAddConnection new start. 
	newProfile ifNil:[^self].
	connectionList items:
		connectionList items , (Array with: SparkleConnectionProfile new)
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializeConnectionList [

	self layout add: (SpkBoxLayout newVertical
			 add: (self newLabel label: 'Connection Profiles')
			 withConstraints: [ :constraints | constraints height: 20 ];
			 add: (connectionList := self newTable
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
	^ connectionList
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializeNewButton [

	toolbar
		add: (self newButton
				 label: 'Add ...';
				 action: [ self createNewConnection ])
		withConstraints: [ :constraints | constraints width: 75; height: 30 ]
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializePresenters [

	super initializePresenters.
	self initializeToolbar.
	self initializeConnectionList
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializeToolbar [
	"Not really a toolbar yet"
	toolbar := SpkBoxLayout newHorizontal. 
	self initializeNewButton. 
	self layout add: toolbar withConstraints: [:constraints | constraints height: 50].
]

{ #category : 'initialization' }
SpkConnectionsPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Connections Launcher';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 400 @ 300
]

{ #category : 'accessing' }
SpkConnectionsPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
