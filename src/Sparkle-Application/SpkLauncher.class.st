Class {
	#name : #SpkLauncher,
	#superclass : #SpPresenter,
	#instVars : [
		'clientConnection',
		'serverConnection',
		'startClientButton',
		'startServerButton',
		'clientService'
	],
	#category : #'Sparkle-Application'
}

{ #category : #specs }
SpkLauncher class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #startServerButton;
		add: #startClientButton;
		yourself
]

{ #category : #private }
SpkLauncher >> createClientService [
	clientService := SpkTextServiceClient forConnection: clientConnection.
	self openTextPresenterOn: clientService
]

{ #category : #initialization }
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

{ #category : #initialization }
SpkLauncher >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Embryonic Sparkle Launcher';
		initialExtent: 200 @ 30;
		aboutText: 'Central window of the Pharo IDE for GemStone'
]

{ #category : #actions }
SpkLauncher >> launchClient [
	clientConnection := RsrConnection
		connectToHost: 'localhost'
		port: self portNumber.
	clientConnection logToTranscript.
	self createClientService
]

{ #category : #actions }
SpkLauncher >> launchServer [
	serverConnection := RsrConnection acceptOn: self portNumber.
	serverConnection logToTranscript
]

{ #category : #private }
SpkLauncher >> openTextPresenterOn: aService [
	"Exploratory"

	(SpkTextPresenter
		newApplication: application
		owner: self
		model: aService) openWithSpec
]

{ #category : #constants }
SpkLauncher >> portNumber [
	^ 6842
]

{ #category : #accessing }
SpkLauncher >> startClientButton [
	^ startClientButton
]

{ #category : #accessing }
SpkLauncher >> startServerButton [
	^ startServerButton
]
