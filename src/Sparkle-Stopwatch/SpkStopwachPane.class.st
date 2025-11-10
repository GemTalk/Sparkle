Class {
	#name : 'SpkStopwachPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'service',
		'timePresenter',
		'startStopButton'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'initialization' }
SpkStopwachPane >> connectPresenters [ 
	"Nothing for now, prevent superclass implementation from doing stuff no longer appropriate."
]

{ #category : 'accessing' }
SpkStopwachPane >> elapsedTimeString: aString [

	timePresenter label: aString
]

{ #category : 'accessing' }
SpkStopwachPane >> headerClass [

	^ SpkErrorPaneHeader
]

{ #category : 'initialization' }
SpkStopwachPane >> initializePresenters [

	super initializePresenters.
	self initializeHeader.
	self header labelString: self labelString.
	self
		initializeTimePresenter;
		initializeStartStopButton
]

{ #category : 'initialization' }
SpkStopwachPane >> initializeStartStopButton [

	startStopButton := self newIconButton
		                   icon: (self iconNamed: #proceed96);
		                   help: 'Start Stopwatch';
		                   action: [ self startStopwatch ];
		                   yourself.
	self layout add: startStopButton
]

{ #category : 'initialization' }
SpkStopwachPane >> initializeTimePresenter [

	timePresenter := self newLabel.
	timePresenter
		addStyle: 'label.elapsedTime';
		label: '00:00:00.0';
		yourself.
	self layout add: timePresenter
]

{ #category : 'accessing' }
SpkStopwachPane >> labelString [

	^ 'Stopwatch'
]
