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
		'portText'
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
		             action: [ self add ].
	removeButton := self newButton
		                label: 'Remove';
		                icon: (self iconNamed: #smallDelete);
		                action: [ self remove ].
	saveButton := self newButton
		              label: 'Change';
		              action: [ self save ].
	cancelButton := self newButton
		                label: 'Cancel'; icon: (self iconNamed: #delete);
		                action: [ self cancel ].
	connectButton := self newButton
		                 label: 'Connect'; 
		                 action: [ self connect ].
	disconnectButton := self newButton
		                    label: 'Disconnect';
		                    action: [ self disconnect ].
	self layout add: (SpkBoxLayout newHorizontal beHomogeneous
			 add: addButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: removeButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: saveButton
			 withConstraints: [ :constraints | constraints height: 30 ];
			 add: cancelButton
			 withConstraints: [ :constraints | constraints height: 30 ]).

	self layout
		add: (SpkBoxLayout newHorizontal beHomogeneous
				 add: connectButton
				 withConstraints: [ :constraints | constraints height: 30 ];
				 add: disconnectButton
				 withConstraints: [ :constraints | constraints height: 30 ])
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
SpkConnectionPresenter >> initializeHostAndPortPresenter [

	| labelBox inputBox |
	labelBox := SpkBoxLayout newHorizontal.
	labelBox
		add: (self newLabel label: 'Host:')
		withConstraints: [ :constraints | constraints height: 20 ].
	labelBox
		add: (self newLabel label: 'Port:')
		withConstraints: [ :constraints | constraints height: 20 ].
	self layout add: labelBox.
	inputBox := SpkBoxLayout newHorizontal.
	hostText := self newTextInput.
	inputBox
		add: hostText
		withConstraints: [ :constraints | constraints height: 30 ].
	portText := self newTextInput.
	inputBox
		add: portText
		withConstraints: [ :constraints | constraints height: 30 ].
	self layout add: inputBox
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
	self initializeHostAndPortPresenter.
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
	^ true
]
