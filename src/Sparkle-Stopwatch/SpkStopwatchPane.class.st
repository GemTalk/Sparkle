Class {
	#name : 'SpkStopwatchPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'service',
		'timePresenter',
		'stopButton',
		'resetButton',
		'startButton'
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
SpkStopwatchPane >> initializeButtons [

	| buttonLayout |
	startButton := self newIconButton
		                   icon: (self iconNamed: #proceed96);
		                   help: 'Start Stopwatch';
		                   action: [ self startStopwatch ];
		                   yourself.
	stopButton := self newIconButton
		              icon: (self iconNamed: #debug96);
		              help: 'Pause Stopwatch';
		              action: [ self pauseStopwatch ];
		              yourself.
	resetButton := self newIconButton
		               icon: (self iconNamed: #refresh96);
		               help: 'Reset time to zero';
		               action: [ self resetStopwatch ];
		               yourself.
	buttonLayout := SpkBoxLayout newHorizontal.
	buttonLayout
		add: startButton;
		add: resetButton.
	self layout add: buttonLayout
]

{ #category : 'initialization' }
SpkStopwatchPane >> initializePresenters [

	super initializePresenters.
	self initializeHeader.
	self header labelString: self labelString.
	self
		initializeTimePresenter;
		initializeButtons
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
