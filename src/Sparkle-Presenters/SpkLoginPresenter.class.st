"
I control the presenters in the Sparkle login window. 

Accepts host / port. Connects to a server. Opens a server workspace when connected. 

SparkleLogin - The application window that holds me. 

SparkleLogin class>>example
"
Class {
	#name : 'SpkLoginPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'hostText',
		'portText',
		'hostLabel',
		'portLabel',
		'connectButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkLoginPresenter >> connectButton [

	^ connectButton
]

{ #category : 'accessing' }
SpkLoginPresenter >> connectButton: anObject [

	connectButton := anObject
]

{ #category : 'accessing' }
SpkLoginPresenter >> hostText [

	^ hostText
]

{ #category : 'accessing' }
SpkLoginPresenter >> hostText: anObject [

	hostText := anObject
]

{ #category : 'initialization' }
SpkLoginPresenter >> initializePresenters [

	super initializePresenters.
	hostText := self newTextInput.
	portText := self newTextInput.
	hostLabel := self newLabel.
	hostLabel label: 'Host:'.
	portLabel := self newLabel.
	portLabel label: 'Port:'.
	connectButton := self newButton
		                 label: 'Connect';
		                 action: [ self halt: 'to do' ].
	self layout add: connectButton withConstraints: [ :constraints | 
		constraints
			width: self class buttonWidth;
			height: self class buttonHeight ]
]

{ #category : 'initialization' }
SpkLoginPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Sparkle Connect';
		initialExtent: 300 @ 150
]

{ #category : 'accessing' }
SpkLoginPresenter >> newLayout [

	| gridLayout |
	gridLayout := SpGridLayout new
		              beColumnNotHomogeneous;
		              beRowNotHomogeneous.

	gridLayout
		add: hostLabel at: 1 @ 1;
		add: hostText at: 2 @ 1;
		add: portLabel at: 1 @ 2;
		add: portText at: 2 @ 2.
	^ SpkBoxLayout newVertical
		  add: gridLayout;
		  yourself
]

{ #category : 'accessing' }
SpkLoginPresenter >> portText [

	^ portText
]

{ #category : 'accessing' }
SpkLoginPresenter >> portText: anObject [

	portText := anObject
]
