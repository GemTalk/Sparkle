"
Shows the loaded git sha of the two key repositories for Sparkle - 
Sparkle & RemoteServiceReplication
"
Class {
	#name : 'SpkGitCheckerPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'clientValues',
		'serverValues'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'constants' }
SpkGitCheckerPresenter >> checkerTitle [

	^'Git Checker'
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> gitRepositoryNames [

	"limited to repositories necessary on the client & server for now"

	^ #( 'RemoteServiceReplication' 'Sparkle' )
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeClientRepositoryPresenters [

	clientValues := OrderedCollection new.
	self layout add: (self newLabel label: 'Client:') height: 20.
	IceRepository registry do: [ :repository | 
		| label stream |
		(self gitRepositoryNames includes: repository name) ifTrue: [ 
			clientValues add: (Array
					 with: repository name
					 with: repository branchName
					 with: repository workingCopy referenceCommit shortId).
			label := self newLabel.
			stream := WriteStream on: String new.
			stream
				nextPutAll: clientValues last first;
				space;
				nextPut: $-;
				space;
				nextPutAll: clientValues last second;
				space;
				nextPutAll: clientValues last third.
			label label: stream contents.
			self layout add: label height: 20 ] ]
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeGitCheckerButton [

	| checkerButton |
	checkerButton := self newButton action: [ self window close ].
	(self isInMemoryConnection or: [ clientValues = serverValues ])
		ifTrue: [ 
			checkerButton
				label: 'Woo Hoo!';
				color: Color green ]
		ifFalse: [ 
			checkerButton
				label: 'Shucks.';
				color: Color red ].
	self layout add: checkerButton
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeInMemoryConnectionLabel [

	self layout
		add: (self newLabel
				 label: 'In Memory Connection';
				 yourself)
		height: 20
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeNoConnectionLabel [

	self layout
		add: (self newLabel
				 label: 'No Connection';
				 yourself)
		height: 20
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializePresenters [

	super initializePresenters.
	self initializeClientRepositoryPresenters.
	self initializeServerRepositoryPresenters.
	self initializeGitCheckerButton.
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeServerRepositoryPresenters [

	| service |
	serverValues := OrderedCollection new.
	self layout add: (self newLabel label: 'Server:') height: 20.
	SpkLauncherPresenter connection ifNil: [ 
		^ self initializeNoConnectionLabel ].
	self isInMemoryConnection ifTrue: [ 
		^ self initializeInMemoryConnectionLabel ].
	service := SpkGitServiceClient new registerWith:
		           SpkLauncherPresenter connection.
	self gitRepositoryNames do: [ :repositoryName | 
		| label stream |
		service initializeGitOn: repositoryName.
		serverValues add:
			(Array
				 with: repositoryName
				 with: service branchName
				 with: service sha).
		label := self newLabel.
		stream := WriteStream on: String new.
		stream
			nextPutAll: serverValues last first;
			space;
			nextPut: $-;
			space;
			nextPutAll: serverValues last second;
			space;
			nextPutAll: serverValues last third.
		label label: stream contents.
		self layout add: label height: 20 ]
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self checkerTitle;
		initialExtent: 350 @ 200
	
]

{ #category : 'private - testing' }
SpkGitCheckerPresenter >> isInMemoryConnection [ 

	"Probably should have a method on connection to test this"

^SpkLauncherPresenter connection specification class = RsrInMemoryConnectionSpecification
]

{ #category : 'accessing' }
SpkGitCheckerPresenter >> newLayout [

	^ SpkBoxLayout newVertical yourself
]
