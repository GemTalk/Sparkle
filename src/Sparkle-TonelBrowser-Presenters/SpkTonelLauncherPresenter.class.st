Class {
	#name : 'SpkTonelLauncherPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'toolbar',
		'browserButton',
		'pathField',
		'connection',
		'taskspace'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
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

	self taskspace closeAllWindows.
	self connection close.
	taskspace := connection := nil
]

{ #category : 'accessing' }
SpkTonelLauncherPresenter >> connection [

	^ connection ifNil: [ self initializeConnection ]
]

{ #category : 'layout' }
SpkTonelLauncherPresenter >> defaultLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'initialization' }
SpkTonelLauncherPresenter >> initializeConnection [

	| spec |
	spec := RsrInMemoryConnectionSpecification new.
	^ connection := spec connect
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

	^ taskspace := SpkTaskspace forConnection: self connection
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

{ #category : 'accessing' }
SpkTonelLauncherPresenter >> taskspace [

	^ taskspace ifNil: [ self initializeTaskspace ]
]
