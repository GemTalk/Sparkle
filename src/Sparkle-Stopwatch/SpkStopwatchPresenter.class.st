Class {
	#name : 'SpkStopwatchPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'taskspace',
		'startStopButton'
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
]

{ #category : 'initialization' }
SpkStopwatchPresenter >> initializePresenters [

	super initializePresenters.
	startStopButton := self newIconButton
		                   icon: (self iconNamed: #proceed96);
		                   help: 'Start Stopwatch';
		                   action: [ self startStopwatch ];
		                   yourself.
	self layout add: startStopButton
]

{ #category : 'initialization' }
SpkStopwatchPresenter >> initializeTaskspace [

	^ taskspace := SpkTaskspace forConnection: self newConnection
]

{ #category : 'initialization' }
SpkStopwatchPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Stopwatch';
		initialExtent: 400 @ 400;
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
