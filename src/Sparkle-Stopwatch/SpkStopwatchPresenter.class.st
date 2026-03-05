Class {
	#name : 'SpkStopwatchPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'taskspace',
		'startStopButton',
		'resetButton',
		'timeDisplay'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'building menus' }
SpkStopwatchPresenter >> buildHamburgerMenu [ 

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Null') asSpecGroup
		description: 'Nothing to see here yet';
		beDisplayedAsGroup;
		yourself.
	^commandGroup
]

{ #category : 'initialization' }
SpkStopwatchPresenter >> closeWindowsAndConnection [

	self taskspace disconnect.
	taskspace := nil
]

{ #category : 'layout' }
SpkStopwatchPresenter >> defaultLayout [

	^ SpkBoxLayout newVertical
		  color: Color black;
		  yourself
]

{ #category : 'initialization' }
SpkStopwatchPresenter >> initializePresenters [

	| buttonLayout |
	super initializePresenters.
	timeDisplay := self newLabel
		               label: '00:00.0';
		               "beNotEditable;"
		               addStyle: 'label.elapsedTime';
		               yourself.
	startStopButton := self newIconButton
		                   icon: (self iconNamed: #proceed96);
		                   help: 'Start Stopwatch';
		                   action: [ self startStopwatch ];
		                   yourself.
	resetButton := self newIconButton
		               icon: (self iconNamed: #refresh96);
		               help: 'Reset time to zero';
		               action: [ self resetStopwatch ];
		               yourself.
	buttonLayout := SpkBoxLayout newHorizontal.
	buttonLayout
		add: startStopButton;
		add: resetButton.

	self layout
		add: timeDisplay;
		add: buttonLayout
]

{ #category : 'initialization' }
SpkStopwatchPresenter >> initializeTaskspace [

	^ taskspace := SpkTaskspace forConnection: self newConnection
]

{ #category : 'initialization' }
SpkStopwatchPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Stopwatch';
		initialExtent: 500 @ 400;
		beNotResizable;
		whenClosedDo: [ self closeWindowsAndConnection ]
]

{ #category : 'instance creation' }
SpkStopwatchPresenter >> newConnection [

	| spec |
	spec := RsrInMemoryConnectionSpecification new.
	^ spec connect
]

{ #category : 'accessing' }
SpkStopwatchPresenter >> taskspace [

	^ taskspace ifNil: [ self initializeTaskspace ]
]
