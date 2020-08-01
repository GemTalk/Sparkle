Class {
	#name : 'SpkLauncher',
	#superclass : 'SpPresenter',
	#instVars : [
		'clientConnection',
		'serverConnection',
		'startClientButton',
		'startServerButton',
		'clientService'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'specs' }
SpkLauncher class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #startServerButton;
		add: #startClientButton;
		yourself
]

{ #category : 'actions' }
SpkLauncher >> connectionAcceptor [
	^ RsrAcceptConnection port: self portNumber
]

{ #category : 'private' }
SpkLauncher >> connectionInitiator [
	^ RsrInitiateConnection
		host: self remoteHostname
		port: self portNumber
]

{ #category : 'private' }
SpkLauncher >> createClientService [
	clientService := SpkTextServiceClient forConnection: clientConnection.
	self openTextPresenterOn: clientService.
	"Force replication, which opens remote window"
	clientService updateRemote
]

{ #category : 'initialization' }
SpkLauncher >> initializePresenters [
	startServerButton := self newButton
		label: 'Launch Server';
		color: Color red darker darker;
		action: [ self launchServer ];
		yourself.
	startClientButton := self newButton
		label: 'Launch Client';
		color: Color blue darker darker;
		action: [ self launchClient ];
		yourself.
	self focusOrder
		add: startServerButton;
		add: startClientButton
]

{ #category : 'initialization' }
SpkLauncher >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Embryonic Sparkle Launcher';
		initialExtent: 200 @ 30;
		aboutText: 'Central window of the Pharo IDE for GemStone'
]

{ #category : 'actions' }
SpkLauncher >> launchClient [
	clientConnection := self connectionInitiator connect.
	"clientConnection log addSink: RsrTranscriptSink new."
	self createClientService
]

{ #category : 'actions' }
SpkLauncher >> launchServer [
	serverConnection := self connectionAcceptor connect
	"serverConnection log addSink: RsrTranscriptSink new"
]

{ #category : 'private' }
SpkLauncher >> openTextPresenterOn: aService [
	"Exploratory"

	(SpkTextPresenter
		newApplication: application
		owner: self
		model: aService) openWithSpec
]

{ #category : 'constants' }
SpkLauncher >> portNumber [
	^ 6842
]

{ #category : 'constants' }
SpkLauncher >> remoteHostname [
	^ 'localhost'
]

{ #category : 'accessing' }
SpkLauncher >> startClientButton [
	^ startClientButton
]

{ #category : 'accessing' }
SpkLauncher >> startServerButton [
	^ startServerButton
]
