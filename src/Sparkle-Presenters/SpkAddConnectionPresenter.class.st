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
		'groupText',
		'addButton',
		'connectionProfile',
		'removeButton',
		'saveButton',
		'cancelButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkAddConnectionPresenter >> add [

	self updateConnectionProfile.
	(SparkleConnectionProfile addProfile: connectionProfile copy) 
		ifTrue: [ self initializeConnectionProfile ]
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> cancel [

	self updateGUI
	
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
	self layout add: (SpkBoxLayout newHorizontal beHomogeneous
			 add: addButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: removeButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: saveButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: cancelButton
			 withConstraints: [ :constraints | constraints height: 30 ])
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeConnectionProfile [

	connectionProfile := SparkleConnectionProfile new. 
	self updateGUI. 
	
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeGroupPresenter [

	self layout
		add: (self newLabel label: 'Group: (Optional)')
		withConstraints: [ :constraints | constraints height: 20 ].
	groupText := self newTextInput.
	self layout
		add: groupText
		withConstraints: [ :constraints | constraints height: 30 ]
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
		                    whenChangedDo: [ self updateConnectionProfile ];
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
	self initializeGroupPresenter.
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

{ #category : 'actions' }
SpkAddConnectionPresenter >> remove [

	owner removeProfiles.
	self initializeConnectionProfile
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> save [
	self updateConnectionProfile. 
	SparkleConnectionProfile profileChanged: connectionProfile 

	
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
		group: groupText text;
		inMemory: inMemoryCheckbox state
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> updateGUI [

	nameText text: connectionProfile name.
	hostText text: connectionProfile host.
	portText text: connectionProfile port.
	groupText text: connectionProfile group. 
	inMemoryCheckbox state: connectionProfile inMemory
]
