"
I control the presenters in the Sparkle login window. 

Accepts host / port. Connects to a server. Opens a server workspace when connected. 

SparkleLogin - The application window that holds me. 

SparkleLogin class>>example
"
Class {
	#name : 'SpkLauncherPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'hostText',
		'portText',
		'hostLabel',
		'portLabel',
		'connectButton',
		'disconnectButton',
		'explorerButton'
	],
	#classVars : [
		'Connection'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkLauncherPresenter class >> connection [

	^Connection
]

{ #category : 'actions' }
SpkLauncherPresenter >> connect [

	| initiator |
	self disconnect.
	initiator := RsrInitiateConnection
		             host: hostText text
		             port: portText text asInteger.
	Connection := initiator connect.
	self openExplorer
]

{ #category : 'accessing' }
SpkLauncherPresenter >> connectButton [

	^ connectButton
]

{ #category : 'accessing' }
SpkLauncherPresenter >> connectButton: anObject [

	connectButton := anObject
]

{ #category : 'initialization' }
SpkLauncherPresenter >> connectPresenters [

	super connectPresenters.
	connectButton whenActivatedDo: [self enableButtons]. 
	disconnectButton whenActivatedDo: [self enableButtons]. 
]

{ #category : 'constants' }
SpkLauncherPresenter >> defaultPort [

	^ '29299'
]

{ #category : 'actions' }
SpkLauncherPresenter >> disconnect [

	Connection ifNotNil: [ :conn | 
		conn close.
		Connection := nil ]
]

{ #category : 'accessing' }
SpkLauncherPresenter >> disconnectButton [

	^ disconnectButton
]

{ #category : 'accessing' }
SpkLauncherPresenter >> disconnectButton: anObject [

	disconnectButton := anObject
]

{ #category : 'initialization' }
SpkLauncherPresenter >> enableButtons [

	connectButton enabled: Connection isNil.
	disconnectButton enabled: Connection isNil not.
	explorerButton enabled: Connection isNil not
]

{ #category : 'accessing' }
SpkLauncherPresenter >> hostText [

	^ hostText
]

{ #category : 'accessing' }
SpkLauncherPresenter >> hostText: anObject [

	hostText := anObject
]

{ #category : 'initialization' }
SpkLauncherPresenter >> initializeButtons [

	| gridLayout |
	gridLayout := SpGridLayout new.
	self initializeConnectButton.
	gridLayout add: connectButton at: 1 @ 1.
	self initializeDisconnectButton.
	gridLayout add: disconnectButton at: 2 @ 1.
	self initializeExplorerButton.
	gridLayout add: explorerButton at: 3 @ 1.
	self layout add: gridLayout.
	self enableButtons
]

{ #category : 'initialization' }
SpkLauncherPresenter >> initializeConnectButton [

	connectButton := self newButton
		                 label: 'Connect';
		                 action: [ self connect ].
	^ connectButton
]

{ #category : 'initialization' }
SpkLauncherPresenter >> initializeDisconnectButton [

	disconnectButton := self newButton
		                    label: 'Disconnect';
		                    action: [ self disconnect ].
]

{ #category : 'initialization' }
SpkLauncherPresenter >> initializeExplorerButton [

	explorerButton := self newButton
		                  label: 'Open Explorer';
		                  action: [ self openExplorer ].
	^ explorerButton
]

{ #category : 'initialization' }
SpkLauncherPresenter >> initializePresenters [

	super initializePresenters.
	hostText := self newTextInput.
	hostText text: 'uffda'.
	portText := self newTextInput.
	portText text: self defaultPort.
	hostLabel := self newLabel.
	hostLabel label: 'Host:'.
	portLabel := self newLabel.
	portLabel label: 'Port:'.
	self initializeButtons
]

{ #category : 'initialization' }
SpkLauncherPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self launcherTitle;
		initialExtent: 350 @ 175
]

{ #category : 'constants' }
SpkLauncherPresenter >> launcherTitle [

	^ 'Sparkle Connect'
]

{ #category : 'accessing' }
SpkLauncherPresenter >> newLayout [

	| gridLayout |
	gridLayout := SpGridLayout new
		              beColumnNotHomogeneous;
		              beRowNotHomogeneous.

	gridLayout
		add: hostLabel at: 1 @ 1;
		add: hostText at: 2 @ 1;
		add: portLabel at: 1 @ 2;
		add: portText at: 2 @ 2.
	^ SpkBoxLayout newVertical
		  add: gridLayout;
		  yourself
]

{ #category : 'actions' }
SpkLauncherPresenter >> openExplorer [

	| taskspace |
	taskspace := SparkleTaskspace new.
	taskspace
		connection: Connection;
		openNewDefaultTaskspace
]

{ #category : 'accessing' }
SpkLauncherPresenter >> portText [

	^ portText
]

{ #category : 'accessing' }
SpkLauncherPresenter >> portText: anObject [

	portText := anObject
]
