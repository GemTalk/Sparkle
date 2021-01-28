"
Adds or Edits an existing connection and returns an instance of SparkleConnectionProfile
"
Class {
	#name : 'SpkAddConnectionPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'inMemoryCheckbox',
		'addOrEditButton',
		'cancelButton',
		'hostText',
		'portText',
		'nameText'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkAddConnectionPresenter >> addOrEdit [
]

{ #category : 'actions' }
SpkAddConnectionPresenter >> cancel [
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeButtons [

	addOrEditButton := self newButton
		                   label: 'Add';
		                   action: [ self addOrEdit ].
	cancelButton := self newButton
		                label: 'Cancel';
		                action: [ self cancel ].
	self layout add: (SpkBoxLayout newHorizontal
			 add: addOrEditButton withConstraints: [ :constraints | 
				 constraints
					 width: 50;
					 height: 30 ];
			 add: (SpkBoxLayout newHorizontal
					  add: cancelButton
					  withConstraints: [ :constraints | 
						  constraints
							  width: 50;
							  height: 30 ]))
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializeHostPresenter [

	self layout
		add: (self newLabel label: 'Host:')
		withConstraints: [ :constraints | constraints height: 30 ].
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
		withConstraints: [ :constraints | constraints height: 30 ].
	nameText := self newTextInput.
	self layout
		add: nameText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkAddConnectionPresenter >> initializePortPresenter [

	self layout
		add: (self newLabel label: 'Port:')
		withConstraints: [ :constraints | constraints height: 30 ].
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
		borderWidth: 3;
		initialExtent: 250 @ 300
]

{ #category : 'accessing' }
SpkAddConnectionPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
