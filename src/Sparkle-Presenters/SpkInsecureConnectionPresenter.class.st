"
Adds or Edits an existing connection and returns an instance of SparkleConnectionProfile
"
Class {
	#name : 'SpkInsecureConnectionPresenter',
	#superclass : 'SpkConnectionPresenter',
	#instVars : [
		'inMemoryCheckbox',
		'portText'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkInsecureConnectionPresenter class >> connectionProfileClass [

	^ SparkleInsecureConnectionProfile
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> connect [

	| connectionThing connection |
	connectionThing := inMemoryCheckbox state
		                   ifTrue: [ RsrInMemoryConnectionSpecification new ]
		                   ifFalse: [ 
			                   RsrInitiateConnection
				                   host: hostText text
				                   port: portText text asInteger ].
	connection := connectionThing connect.
	self openExplorer: connection.
	^ connection
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenter >> inMemoryCheckbox [

	^ inMemoryCheckbox
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenter >> inMemoryCheckbox: anObject [

	inMemoryCheckbox := anObject
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initializeInMemoryCheckbox [

	inMemoryCheckbox := self newCheckBox
		                    label: 'In Memory (will ignore host/port)';
		                    whenChangedDo: [ self updateConnectionProfile ];
		                    yourself.
	inMemoryCheckbox help:
		'Make a client-only connection. Ignores host/port'.
	self layout
		add: inMemoryCheckbox
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initializePortPresenter [

	self layout
		add: (self newLabel label: 'Port:')
		withConstraints: [ :constraints | constraints height: 20 ].
	portText := self newTextInput.
	self layout
		add: portText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initializePresenters [

	super initializePresenters.
	self initializePortPresenter.
	self initializeInMemoryCheckbox.
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenter >> portText [

	^ portText
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenter >> portText: anObject [

	portText := anObject
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> updateConnectionProfile [

	super updateConnectionProfile.
	connectionProfile
		port: portText text;
		inMemory: inMemoryCheckbox state
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> updateGUI [

	super updateGUI ifFalse: [ ^ false ].
	portText text: connectionProfile port.
	inMemoryCheckbox state: connectionProfile inMemory
]
