"
Adds or Edits an existing connection and returns an instance of SparkleConnectionProfile
"
Class {
	#name : 'SpkInsecureConnectionPresenterB',
	#superclass : 'SpkConnectionPresenter',
	#instVars : [
		'portText',
		'inMemoryCheckbox'
	],
	#category : 'Sparkle-Presenters-Presenters',
	#package : 'Sparkle-Presenters',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
SpkInsecureConnectionPresenterB class >> connectionProfileClass [

	^ SpkDirectConnectionProfileB
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenterB >> inMemoryCheckbox [

	^ inMemoryCheckbox
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenterB >> inMemoryCheckbox: anObject [

	inMemoryCheckbox := anObject
]

{ #category : 'initialization' }
SpkInsecureConnectionPresenterB >> initializeHostAndPortPresenter [

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
SpkInsecureConnectionPresenterB >> initializeInMemoryCheckbox [

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
SpkInsecureConnectionPresenterB >> initializePresenters [

	super initializePresenters.
	self initializeHostAndPortPresenter.
	self initializeInMemoryCheckbox.
	self addVerticalSpaceTo: self layout height: 145. 
	self initializeButtons.
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenterB >> portText [

	^ portText
]

{ #category : 'accessing' }
SpkInsecureConnectionPresenterB >> portText: anObject [

	portText := anObject
]

{ #category : 'actions' }
SpkInsecureConnectionPresenterB >> updateConnectionProfile [

	| trimmedPort |
	super updateConnectionProfile.
	trimmedPort := portText text trimBoth.
	connectionProfile
		port: trimmedPort;
		inMemory: inMemoryCheckbox state.
	"give visible feedback of trimmed text"
	portText text: trimmedPort
]

{ #category : 'actions' }
SpkInsecureConnectionPresenterB >> updateGUI [

	super updateGUI.
	portText text: connectionProfile port.
	inMemoryCheckbox state: connectionProfile inMemory
]
