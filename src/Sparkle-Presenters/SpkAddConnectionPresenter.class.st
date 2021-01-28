"
Adds or Edits an existing connection and returns an instance of SparkleConnectionProfile
"
Class {
	#name : 'SpkAddConnectionPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'inMemoryCheckbox',
		'hostText',
		'portText',
		'nameText',
		'addButton',
		'editButton',
		'connectionProfile',
		'clearButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkAddConnectionPresenter >> addOrEdit [ 

	owner addOrEdit.
	
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> cancel [
]

{ #category : 'accessing' }
SpkAddConnectionPresenter >> connectionProfile [

	^ connectionProfile
]

{ #category : 'accessing' }
SpkAddConnectionPresenter >> connectionProfile: anObject [

	connectionProfile := anObject
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initialize [

	super initialize. 
	self initializeConnectionProfile
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeButtons [

	addButton := self newButton
		             label: 'Add';
		             action: [ self addOrEdit ].
	editButton := self newButton
		              label: 'Edit';
		              action: [ self addOrEdit ].
	clearButton := self newButton
		              label: 'Clear';
		              action: [ self initializeConnectionProfile  ].
	self layout add: (SpkBoxLayout newHorizontal beHomogeneous
			 add: addButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: editButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: clearButton
			 withConstraints: [ :constraints | constraints height: 30 ])
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> initializeConnectionProfile [

	connectionProfile := SparkleConnectionProfile new. 
	self updateGUI. 
	
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeHostPresenter [

	self layout
		add: (self newLabel label: 'Host:')
		withConstraints: [ :constraints | constraints height: 20 ].
	hostText := self newTextInput.
	self layout
		add: hostText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeInMemoryCheckbox [

	inMemoryCheckbox := self newCheckBox
		                    label: 'In Memory (will ignore host/port)';
		                    yourself.
	inMemoryCheckbox help:
		'Make a client-only connection. Ignores host/port'.
	self layout
		add: inMemoryCheckbox
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeNamePresenter [

	self layout
		add: (self newLabel label: 'Name:')
		withConstraints: [ :constraints | constraints height: 20 ].
	nameText := self newTextInput.
	self layout
		add: nameText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializePortPresenter [

	self layout
		add: (self newLabel label: 'Port:')
		withConstraints: [ :constraints | constraints height: 20 ].
	portText := self newTextInput.
	self layout
		add: portText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializePresenters [

	super initializePresenters.
	self initializeNamePresenter. 
	self initializeHostPresenter.
	self initializePortPresenter.
	self initializeInMemoryCheckbox.
	self initializeButtons. 
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Add Connection';
		borderColor: Color purple;
		borderWidth: 3
]

{ #category : 'accessing' }
SpkAddConnectionPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkAddConnectionPresenter >> newTextInput [

	^ super newTextInput
		  whenTextChangedDo: [ self updateConnectionProfile ];
		  autoAccept: true
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> setConnectionProfile: aConnectionProfile [

	connectionProfile := aConnectionProfile. 
	self updateGUI. 
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> updateConnectionProfile [

	connectionProfile
		name: nameText text;
		host: hostText text;
		port: portText text;
		inMemory: inMemoryCheckbox state
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> updateGUI [

	nameText text: connectionProfile name.
	hostText text: connectionProfile host.
	portText text: connectionProfile port.
	inMemoryCheckbox state: connectionProfile inMemory
]
