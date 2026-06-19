Class {
	#name : 'SpkTonelLauncherPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'toolbar',
		'browserButton',
		'pathField',
		'taskspace'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Obsolete',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Obsolete'
}

{ #category : 'building menus' }
SpkTonelLauncherPresenter >> buildHamburgerMenu [ 

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Null') asSpecGroup
		description: 'Nothing to see here yet';
		beDisplayedAsGroup;
		yourself.
	^commandGroup
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> closeBrowsersAndConnection [

	self taskspace disconnect.
	taskspace := nil
]

{ #category : 'layout' }
SpkTonelLauncherPresenter >> defaultLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> initializeEntryField [

self layout
		add: (self newLabel label: 'Path to package directory:')
		withConstraints: [ :constraints | constraints height: 20 ].
	pathField	 := self newTextInput.
	self layout
		add: pathField
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> initializePresenters [

	super initializePresenters.
	self
		initializeToolbar;
		initializeEntryField
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> initializeTaskspace [

	^ taskspace := SpkTaskspace forConnection: self newConnection
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> initializeToolbar [

	toolbar := self newToolbar
		           addItem: (browserButton := SpToolbarButtonPresenter new
				                             label: 'Browse Directory';
				                             icon:
					                             (self iconNamed: #smallSystemBrowser);
				                             help:
					                             'Open a Sparkle Tonel Browser on the path below';
				                             action: [ self newBrowser ];
				                             yourself);
		           addItem: (browserButton := SpToolbarButtonPresenter new
				                             label: 'Stopwatch';
				                             icon: (self iconNamed: #proceed28);
				                             help: 'Open a stopwatch';
				                             action: [ self newStopwatch ];
				                             yourself);
		           yourself.
	self layout add: #toolbar
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Tonel Browser Launcher';
		initialExtent: 400 @ 150;
		whenClosedDo: [ self closeBrowsersAndConnection ]
]

{ #category : 'actions' }
SpkTonelLauncherPresenter >> newBrowser [

	self taskspace newBrowser: pathField text
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> newConnection [

	| spec |
	spec := RsrInMemoryConnectionSpecification new.
	^ spec connect
]

{ #category : 'accessing' }
SpkTonelLauncherPresenter >> taskspace [

	^ taskspace ifNil: [ self initializeTaskspace ]
]
