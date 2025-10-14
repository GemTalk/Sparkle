Class {
	#name : 'SpkTonelLauncherPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'toolbar',
		'browserButton',
		'pathField'
	],
	#category : 'Sparkle-TonelBrowser-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters'
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

{ #category : 'layout' }
SpkTonelLauncherPresenter >> defaultLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'as yet unclassified' }
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
		whenClosedDo: [ "
			SpkConnectionProfile profileAnnouncer unsubscribe: self.
			SpkConnectionProfile profileAnnouncer unsubscribe:
					gciConnectionPresenter.
			SpkConnectionProfile profileAnnouncer unsubscribe:
					insecureConnectionPresenter "]
]
