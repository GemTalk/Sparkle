"
Adds or Edits an existing connection and returns an instance of SparkleConnectionProfile
"
Class {
	#name : 'SpkInsecureConnectionPresenter',
	#superclass : 'SpkConnectionPresenter',
	#instVars : [
		'portText',
		'inMemoryCheckbox'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkInsecureConnectionPresenter class >> connectionProfileClass [

	^ SpkDirectConnectionProfile
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
SpkInsecureConnectionPresenter >> initializeHostAndPortPresenter [

	| labelBox inputBox inputAndLabelBox |
	inputAndLabelBox := SpkBoxLayout newVertical.
	labelBox := SpkBoxLayout newHorizontal.
	labelBox add: (self newLabel label: 'Host:') height: 20.
	self addHorizontalSpaceTo: labelBox.
	labelBox add: (self newLabel label: 'Port:') height: 20.
	inputAndLabelBox add: labelBox.
	inputBox := SpkBoxLayout newHorizontal.
	hostText := self newTextInput.
	inputBox add: hostText height: 30.
	self addHorizontalSpaceTo: inputBox.
	portText := self newTextInput.
	inputBox add: portText height: 30.
	inputAndLabelBox add: inputBox.
	self layout add: inputAndLabelBox height: 50
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenter >> initializeInMemoryCheckbox [

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
SpkInsecureConnectionPresenter >> initializePresenters [

	super initializePresenters.
	self initializeHostAndPortPresenter.
	self initializeInMemoryCheckbox.
	self addVerticalSpaceTo: self layout height: 145. 
	self initializeButtons.
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

	super updateGUI.
	portText text: connectionProfile port.
	inMemoryCheckbox state: connectionProfile inMemory
]
