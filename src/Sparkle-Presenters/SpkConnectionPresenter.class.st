Class {
	#name : 'SpkConnectionPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionProfile',
		'groupText',
		'nameText',
		'hostText'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkConnectionPresenter class >> connectionProfileClass [

	^self subclassResponsibility 
]

{ #category : 'actions' }
SpkConnectionPresenter >> add [

	self updateConnectionProfile.
	self class connectionProfileClass addProfile: connectionProfile copy
]

{ #category : 'actions' }
SpkConnectionPresenter >> cancel [

	self updateGUI
	
]

{ #category : 'accessing' }
SpkConnectionPresenter >> connectionProfile [

	^ connectionProfile
]

{ #category : 'accessing' }
SpkConnectionPresenter >> connectionProfile: anObject [

	connectionProfile := anObject
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initialize [

	super initialize. 
	self initializeConnectionProfile
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializeConnectionProfile [

	connectionProfile := self class connectionProfileClass new. 
	self updateGUI. 
	
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializeGroupPresenter [

	self layout
		add: (self newLabel label: 'Group: (Optional)')
		withConstraints: [ :constraints | constraints height: 20 ].
	groupText := self newTextInput.
	self layout
		add: groupText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializeHostPresenter [

	self layout
		add: (self newLabel label: 'Host:')
		withConstraints: [ :constraints | constraints height: 20 ].
	hostText := self newTextInput.
	self layout
		add: hostText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializeNamePresenter [

	self layout
		add: (self newLabel label: 'Name:')
		withConstraints: [ :constraints | constraints height: 20 ].
	nameText := self newTextInput.
	self layout
		add: nameText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializePresenters [

	super initializePresenters.
	self initializeNamePresenter. 
	self initializeGroupPresenter.
	self initializeHostPresenter.
]

{ #category : 'actions' }
SpkConnectionPresenter >> remove [

	self initializeConnectionProfile
]

{ #category : 'actions' }
SpkConnectionPresenter >> save [
	self updateConnectionProfile. 
	self class connectionProfileClass profileChanged: connectionProfile 

	
]

{ #category : 'actions' }
SpkConnectionPresenter >> setConnectionProfile: aConnectionProfile [

	connectionProfile := aConnectionProfile. 
	self updateGUI. 
]

{ #category : 'actions' }
SpkConnectionPresenter >> updateConnectionProfile [
	connectionProfile
		name: nameText text;
		host: hostText text;
		group: groupText text
]

{ #category : 'actions' }
SpkConnectionPresenter >> updateGUI [

	nameText text: connectionProfile name.
	hostText text: connectionProfile host.
	groupText text: connectionProfile group.
	^ true
]
