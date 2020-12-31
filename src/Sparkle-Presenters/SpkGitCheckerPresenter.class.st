"
Shows the loaded git sha of the two key repositories for Sparkle - 
Sparkle & RemoteServiceReplication
"
Class {
	#name : 'SpkGitCheckerPresenter',
	#superclass : 'SpkPresenter',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'constants' }
SpkGitCheckerPresenter >> checkerTitle [

	^'Git Checker'
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeClientRepositoryPresenters [

	self layout add: (self newLabel label: 'Client:') height: 20.
	IceRepository registry do: [ :repository | 
		| label stream |
		label := self newLabel.
		stream := WriteStream on: String new.
		stream
			nextPutAll: repository name;
			space;
			nextPut: $-;
			space;
			nextPutAll: repository branchName;
			space;
			nextPutAll: repository workingCopy referenceCommit shortId.
		label label: stream contents.
		self layout add: label height: 20 ]
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
	self initializeServerRepositoryPresenters
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeServerRepositoryPresenters [

	| service |
	self layout add: (self newLabel label: 'Server:') height: 20.
	SpkLauncherPresenter connection ifNil: [ 
		^ self initializeNoConnectionLabel ].
	service := SpkGitServiceClient new registerWith:
		           SpkLauncherPresenter connection.

	#( 'Sparkle' 'RemoteServiceReplication' ) do: [ :repositoryName | 
		| label stream gitService |
		gitService := service initializeGitOn: repositoryName.
		label := self newLabel.
		stream := WriteStream on: String new.
		stream
			nextPutAll: repositoryName;
			space;
			nextPut: $-;
			space;
			nextPutAll: gitService branchName;
			space;
			nextPutAll: gitService sha.
		label label: stream contents.
		self layout add: label height: 20 ]
]

{ #category : 'initialization' }
SpkGitCheckerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self checkerTitle;
		initialExtent: 350 @ 200
	
]

{ #category : 'accessing' }
SpkGitCheckerPresenter >> newLayout [

	^ SpkBoxLayout newVertical yourself
]
