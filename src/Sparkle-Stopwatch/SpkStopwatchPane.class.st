Class {
	#name : 'SpkStopwatchPane',
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
SpkStopwatchPane >> connectPresenters [ 
	"Nothing for now, prevent superclass implementation from doing stuff no longer appropriate."
]

{ #category : 'accessing' }
SpkStopwatchPane >> elapsedTimeString: aString [

	timePresenter label: aString
]

{ #category : 'accessing' }
SpkStopwatchPane >> headerClass [

	^ SpkErrorPaneHeader
]

{ #category : 'initialization' }
SpkStopwatchPane >> initializePresenters [

	super initializePresenters.
	self initializeHeader.
	self header labelString: self labelString.
	self
		initializeTimePresenter;
		initializeStartStopButton
]

{ #category : 'initialization' }
SpkStopwatchPane >> initializeStartStopButton [

	startStopButton := self newIconButton
		                   icon: (self iconNamed: #proceed96);
		                   help: 'Start Stopwatch';
		                   action: [ self startStopwatch ];
		                   yourself.
	self layout add: startStopButton
]

{ #category : 'initialization' }
SpkStopwatchPane >> initializeTimePresenter [

	timePresenter := self newLabel.
	timePresenter
		addStyle: 'label.elapsedTime';
		label: '00:00:00.0';
		yourself.
	self layout add: timePresenter
]

{ #category : 'accessing' }
SpkStopwatchPane >> labelString [

	^ 'Stopwatch'
]

{ #category : 'accessing' }
SpkStopwatchPane >> modelClass [

	^ SpkStopwatchServiceClient
]
