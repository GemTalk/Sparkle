"
Presents a pane with an elapsed time display, a start/stop button, and a reset button.
Its menu allows for undo/redo of the operations of the buttons.
"
Class {
	#name : 'SpkStopwatchPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'service',
		'timePresenter',
		'resetButton',
		'buttonLayout',
		'runButton',
		'pauseButton'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'initialization' }
SpkStopwatchPane >> connectPresenters [
	"No model yet, cannot subscribe to announcements here."

	
]

{ #category : 'buttons' }
SpkStopwatchPane >> currentRunPauseButtonPresenter [
	"Answer the button that is currently displayed, wither runButton or pauseButton."

	^ buttonLayout children first
]

{ #category : 'buttons' }
SpkStopwatchPane >> displayPauseButton [

	self displayRunPauseButton: pauseButton
]

{ #category : 'buttons' }
SpkStopwatchPane >> displayRunButton [

	self displayRunPauseButton: runButton
]

{ #category : 'buttons' }
SpkStopwatchPane >> displayRunPauseButton: desiredButton [

	| currentButton isEnabled |
	currentButton := self currentRunPauseButtonPresenter.
	currentButton == desiredButton ifTrue: [ ^ self ]. "already displaying."
	isEnabled := currentButton isEnabled.
	buttonLayout
		removePresenterAtIndex: 1;
		add: desiredButton before: resetButton.
	desiredButton enabled: isEnabled
]

{ #category : 'accessing' }
SpkStopwatchPane >> elapsedTimeString: aString [

	timePresenter label: aString
]

{ #category : 'accessing' }
SpkStopwatchPane >> headerClass [

	^ SpkErrorPaneHeader
]

{ #category : 'buttons' }
SpkStopwatchPane >> initializeButtons [

	runButton := self newIconButton
		             icon: (self iconNamed: #proceed96);
		             help: 'Run Stopwatch';
		             action: [ self runStopwatch ];
		             yourself.
	pauseButton := self newIconButton
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
		add: runButton;
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
		label: '00:00.0';
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

{ #category : 'actions' }
SpkStopwatchPane >> pauseStopwatch [

	self disableAll.
	model pause
]

{ #category : 'initialization' }
SpkStopwatchPane >> refreshFromService [

	model ifNil: [ ^ self ]. "When first building the pane, spec sends this before model is initialized"
	model isRunning
		ifTrue: [ self displayPauseButton ]
		ifFalse: [ self displayRunButton ].
	timePresenter label: model elapsedTimeString
]

{ #category : 'actions' }
SpkStopwatchPane >> resetStopwatch [

	self disableAll.
	model reset
]

{ #category : 'actions' }
SpkStopwatchPane >> runStopwatch [

	self disableAll.
	model run
]

{ #category : 'initialization' }
SpkStopwatchPane >> subscribeToModel [

	model
		when: SpkUpdateAnnouncement
		send: #receiveUpdateAnnouncement
		to: self;
		when: SpkActionCompleteAnnouncement
		send: #receiveActionCompleteAnnouncement
		to: self
]
