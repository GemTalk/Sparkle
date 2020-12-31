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
SpkGitCheckerPresenter >> initializePresenters [

	super initializePresenters.
	IceRepository registry do: [ :repository | 
		| label stream |
		label := self newLabel.
		stream := WriteStream on: String new.
		stream
			nextPutAll: repository name;
			space;
			nextPutAll: repository branchName;
			space;
			nextPutAll: repository workingCopy referenceCommit shortId.
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
