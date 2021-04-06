Class {
	#name : 'SpkConnectionPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionProfile',
		'groupText',
		'nameText',
		'hostText',
		'addButton',
		'removeButton',
		'saveButton',
		'cancelButton',
		'connectButton',
		'disconnectButton',
		'setPathButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkConnectionPresenter class >> connectionProfileClass [

	^self subclassResponsibility 
]

{ #category : 'actions' }
SpkConnectionPresenter >> add [

	connectionProfile := connectionProfile copy. 
	connectionProfile connection: nil. 
	self updateConnectionProfile.
	self class connectionProfileClass addProfile: connectionProfile
]

{ #category : 'private' }
SpkConnectionPresenter >> addHorizontalSpaceTo: box [

	self
		addHorizontalSpaceTo: box
		width: self defaultHorizontalSpaceWidth
]

{ #category : 'private' }
SpkConnectionPresenter >> addHorizontalSpaceTo: box width: width [

	"dumb way to do put space between widgets. no obvious alternatives."

	box add: (self newLabel label: ' ') width: width
]

{ #category : 'private' }
SpkConnectionPresenter >> addVerticalSpaceTo: box height: height [

	"dumb way to do put space between widgets. no obvious alternatives."

	box add: (self newLabel label: ' ') height: height
]

{ #category : 'actions' }
SpkConnectionPresenter >> cancel [

	self updateGUI
	
]

{ #category : 'actions' }
SpkConnectionPresenter >> closeConnectionWindows [

	| connection connectedPresenters |
	connection := connectionProfile connection.
	connectedPresenters := SparkleTaskspace allInstances select: [ 
		                       :presenter | 
		                       presenter connection == connection ].
	connectedPresenters do: [ :presenter | presenter close ]
]

{ #category : 'actions' }
SpkConnectionPresenter >> connect [

	connectionProfile connect.
	self openExplorer: connectionProfile connection.
]

{ #category : 'initialization' }
SpkConnectionPresenter >> connectPresenters [

	super connectPresenters.
	connectButton whenActivatedDo: [ self enableButtons ].
	disconnectButton whenActivatedDo: [ self enableButtons ].

]

{ #category : 'accessing' }
SpkConnectionPresenter >> connectionProfile [

	^ connectionProfile
]

{ #category : 'accessing' }
SpkConnectionPresenter >> connectionProfile: anObject [

	connectionProfile := anObject
]

{ #category : 'constants' }
SpkConnectionPresenter >> defaultHorizontalSpaceWidth [

	^10
]

{ #category : 'actions' }
SpkConnectionPresenter >> disableButtons [

	connectButton enabled: false.
	disconnectButton enabled: false
]

{ #category : 'actions' }
SpkConnectionPresenter >> disconnect [

	self closeConnectionWindows.
	connectionProfile disconnect
]

{ #category : 'actions' }
SpkConnectionPresenter >> enableButtons [

	self connectionProfile ifNil: [ ^self ].
	connectButton enabled: self connectionProfile connection isNil.
	disconnectButton enabled: self connectionProfile connection isNil not
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initialize [

	super initialize. 
	self initializeConnectionProfile.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileConnectedAnnouncement
		send: #enableButtons
		to: self.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileDisconnectedAnnouncement
		send: #enableButtons
		to: self
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializeButtons [

	addButton := self newButton
		             label: 'Add';
		             icon: (self iconNamed: #add);
		             color: SpkConnectionListPresenter defaultColor;
		             action: [ self add ].
	removeButton := self newButton
		                label: 'Remove';
		                icon: (self iconNamed: #smallDelete);
		                color: SpkConnectionListPresenter defaultColor;
		                action: [ self remove ].
	saveButton := self newButton
		              label: 'Change';
		              color: SpkConnectionListPresenter defaultColor;
		              action: [ self save ].
	cancelButton := self newButton
		                label: 'Cancel';
		                icon: (self iconNamed: #delete);
		                color: SpkConnectionListPresenter defaultColor;
		                action: [ self cancel ].
	connectButton := self newButton
		                 label: 'Connect';
		                 action: [ self connect ].
	disconnectButton := self newButton
		                    label: 'Disconnect';
		                    action: [ self disconnect ].
	self layout add: (SpkBoxLayout newHorizontal
			 add: addButton height: 30;
			 add: removeButton height: 30;
			 add: saveButton height: 30;
			 add: cancelButton height: 30).

	self layout
		add: (SpkBoxLayout newHorizontal
				 add: connectButton
				 height: 30;
				 add: disconnectButton
				 height: 30)
		withConstraints: [ :constraints | constraints height: 40 ].
	self enableButtons
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
SpkConnectionPresenter >> initializeNamePresenter [

	self layout
		add: (self newLabel label: 'Connection Name:')
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
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializeUnselectedProfile [

	self initializeConnectionProfile.
	self disableButtons. 
]

{ #category : 'initialization' }
SpkConnectionPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter whenClosedDo: [ 
		SpkConnectionProfile profileAnnouncer unsubscribe: self ]
]

{ #category : 'accessing' }
SpkConnectionPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkConnectionPresenter >> openExplorer: connection [

	| taskspace |
	taskspace := SparkleTaskspace new.
	taskspace
		connection: connection;
		openNewDefaultTaskspace
]

{ #category : 'actions' }
SpkConnectionPresenter >> remove [

	(self confirm: 'Really remove connection profile?') ifFalse: [ 
		^ self ].
	SpkConnectionProfile removeProfiles:
		(Array with: connectionProfile).
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
	self enableButtons. 
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
]
