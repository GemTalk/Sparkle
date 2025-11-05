Class {
	#name : 'SpkStopwatchLauncherPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'toolbar',
		'stopwatchButton',
		'taskspace'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'building menus' }
SpkStopwatchLauncherPresenter >> buildHamburgerMenu [ 

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Null') asSpecGroup
		description: 'Nothing to see here yet';
		beDisplayedAsGroup;
		yourself.
	^commandGroup
]

{ #category : 'initialization' }
SpkStopwatchLauncherPresenter >> closeWindowsAndConnection [

	self taskspace disconnect.
	taskspace := nil
]

{ #category : 'layout' }
SpkStopwatchLauncherPresenter >> defaultLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'initialization' }
SpkStopwatchLauncherPresenter >> initializePresenters [

	super initializePresenters.
	self
		initializeToolbar
]

{ #category : 'initialization' }
SpkStopwatchLauncherPresenter >> initializeTaskspace [

	^ taskspace := SpkTaskspace forConnection: self newConnection
]

{ #category : 'initialization' }
SpkStopwatchLauncherPresenter >> initializeToolbar [

	toolbar := self newToolbar
		           addItem: (stopwatchButton := SpToolbarButtonPresenter new
				                             label: 'Browse Directory';
				                             icon:
					                             (self iconNamed: #smallSystemBrowser);
				                             help:
					                             'Open a Sparkle Tonel Browser on the path below';
				                             action: [ self newWindow ];
				                             yourself);
		           yourself.
	self layout add: #toolbar
]

{ #category : 'initialization' }
SpkStopwatchLauncherPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Stopwatch Launcher';
		initialExtent: 400 @ 150;
		whenClosedDo: [ self closeWindowsAndConnection ]
]

{ #category : 'instance creation' }
SpkStopwatchLauncherPresenter >> newConnection [

	| spec |
	spec := RsrInMemoryConnectionSpecification new.
	^ spec connect
]

{ #category : 'accessing' }
SpkStopwatchLauncherPresenter >> taskspace [

	^ taskspace ifNil: [ self initializeTaskspace ]
]
