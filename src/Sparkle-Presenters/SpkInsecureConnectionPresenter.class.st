"
Adds or Edits an existing connection and returns an instance of SparkleConnectionProfile
"
Class {
	#name : 'SpkInsecureConnectionPresenter',
	#superclass : 'SpkConnectionPresenter',
	#instVars : [
		'inMemoryCheckbox',
		'hostText',
		'portText',
		'nameText',
		'groupText',
		'addButton',
		'removeButton',
		'saveButton',
		'cancelButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkInsecureConnectionPresenter class >> connectionProfileClass [

	^ SparkleInsecureConnectionProfile
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> add [

	self updateConnectionProfile.
	self class connectionProfileClass addProfile: connectionProfile copy
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> cancel [

	self updateGUI
	
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initialize [

	super initialize. 
	self initializeConnectionProfile
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initializeConnectionProfile [

	connectionProfile := self class connectionProfileClass new. 
	self updateGUI. 
	
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initializeGroupPresenter [

	self layout
		add: (self newLabel label: 'Group: (Optional)')
		withConstraints: [ :constraints | constraints height: 20 ].
	groupText := self newTextInput.
	self layout
		add: groupText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initializeHostPresenter [

	self layout
		add: (self newLabel label: 'Host:')
		withConstraints: [ :constraints | constraints height: 20 ].
	hostText := self newTextInput.
	self layout
		add: hostText
		withConstraints: [ :constraints | constraints height: 30 ]
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
SpkInsecureConnectionPresenter >> initializeNamePresenter [

	self layout
		add: (self newLabel label: 'Name:')
		withConstraints: [ :constraints | constraints height: 20 ].
	nameText := self newTextInput.
	self layout
		add: nameText
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
	self initializeNamePresenter. 
	self initializeHostPresenter.
	self initializePortPresenter.
	self initializeGroupPresenter.
	self initializeInMemoryCheckbox.
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> remove [

	self initializeConnectionProfile
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> save [
	self updateConnectionProfile. 
	self class connectionProfileClass profileChanged: connectionProfile 

	
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> setConnectionProfile: aConnectionProfile [

	connectionProfile := aConnectionProfile. 
	self updateGUI. 
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> updateConnectionProfile [
	connectionProfile
		name: nameText text;
		host: hostText text;
		port: portText text;
		group: groupText text;
		inMemory: inMemoryCheckbox state
]

{ #category : 'actions' }
SpkInsecureConnectionPresenter >> updateGUI [

	nameText text: connectionProfile name.
	hostText text: connectionProfile host.
	portText text: connectionProfile port.
	groupText text: connectionProfile group. 
	inMemoryCheckbox state: connectionProfile inMemory
]
