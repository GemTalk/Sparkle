Class {
	#name : 'SpkGciConnectionPresenter',
	#superclass : 'SpkConnectionPresenter',
	#instVars : [
		'versionText',
		'netldiText',
		'stoneText',
		'pathText',
		'userText',
		'passwordText'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkGciConnectionPresenter class >> connectionProfileClass [

	^ SpkGCIConnectionProfile
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializeNetldiPresenter [

	self layout
		add: (self newLabel label: 'Netldi:')
		withConstraints: [ :constraints | constraints height: 20 ].
	netldiText := self newTextInput.
	self layout
		add: netldiText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializePathPresenter [

	| pathBox |
	pathBox := SpkBoxLayout newHorizontal.
	pathBox
		add: (self newLabel label: 'Client Libraries Path:')
		withConstraints: [ :constraints | constraints height: 20 ].
	setPathButton := self newButton
		                 label: 'Set Path';
		                 icon: (self iconNamed: #smallHome);
		                 action: [ self setPath ].
	pathBox add: setPathButton withConstraints: [ :constraints1 | 
		constraints1
			height: 30;
			width: 100 ].
	self layout add: pathBox.
	pathText := self newTextInput.
	self layout
		add: pathText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializePresenters [

	super initializePresenters.
	self initializeVersionStoneNetldiPresenters.
	self initializeUserPasswordPresenter.
	self initializePathPresenter.
	self initializeButtons. 
	self setFocusOrder
	
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializeStonePresenter [
	| labelBox inputBox |
	self layout
		add: (self newLabel label: 'Stone:')
		withConstraints: [ :constraints | constraints height: 20 ].
	stoneText  := self newTextInput.
	self layout
		add: stoneText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializeUserPasswordPresenter [

	| labelBox inputBox |
	labelBox := SpkBoxLayout newHorizontal.
	labelBox
		add: (self newLabel label: 'User:')
		withConstraints: [ :constraints | constraints height: 20 ].
	labelBox
		add: (self newLabel label: 'Password:')
		withConstraints: [ :constraints | constraints height: 20 ].
	self layout add: labelBox.
	inputBox := SpkBoxLayout newHorizontal.
	userText := self newTextInput.
	inputBox
		add: userText
		withConstraints: [ :constraints | constraints height: 30 ].
	passwordText := self newTextInput bePassword.
	inputBox
		add: passwordText
		withConstraints: [ :constraints | constraints height: 30 ].
	self layout add: inputBox
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializeVersionStoneNetldiPresenters [

	| labelBox inputBox |
	labelBox := SpkBoxLayout newHorizontal.
	labelBox 
		add: (self newLabel label: 'Version:')
		withConstraints: [ :constraints | constraints height: 20 ].
	labelBox
		add: (self newLabel label: 'Stone:')
		withConstraints: [ :constraints | constraints height: 20 ].
	labelBox
		add: (self newLabel label: 'Netldi:')
		withConstraints: [ :constraints | constraints height: 20 ].
	
	self layout add: labelBox.
	inputBox := SpkBoxLayout newHorizontal.
	versionText := self newTextInput.
	inputBox 
		add: versionText
		withConstraints: [ :constraints | constraints height: 30 ].
	stoneText := self newTextInput.
	inputBox
		add: stoneText
		withConstraints: [ :constraints | constraints height: 30 ].
	netldiText := self newTextInput.
	inputBox
		add: netldiText
		withConstraints: [ :constraints | constraints height: 30 ].

	self layout add: inputBox
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> netldiText [

	^ netldiText
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> netldiText: anObject [

	netldiText := anObject
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> setFocusOrder [

	self focusOrder
		add: nameText;
		add: groupText;
		add: hostText;
		add: portText; 
		add: versionText;
		add: stoneText;
		add: netldiText;
		add: userText;
		add: passwordText;
		add: pathText;
		add: setPathButton;
		add: connectButton;
		add: disconnectButton 
		
]

{ #category : 'actions' }
SpkGciConnectionPresenter >> setPath [

	| path |
	path := UIManager default chooseDirectory.
	path ifNil: [ ^ self ].
	connectionProfile path: path fullName.
	SpkGCIConnectionProfile defaultPath: connectionProfile path.
	self updateGUI
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> stoneText [

	^ stoneText
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> stoneText: anObject [

	stoneText := anObject
]

{ #category : 'actions' }
SpkGciConnectionPresenter >> updateConnectionProfile [

	super updateConnectionProfile.
	connectionProfile
		version: versionText text;
		stone: stoneText text;
		netldi: netldiText text;
		path: pathText text;
		user: userText text;
		password: passwordText text
]

{ #category : 'actions' }
SpkGciConnectionPresenter >> updateGUI [

	super updateGUI.
	versionText text: connectionProfile version.
	netldiText text: connectionProfile netldi.
	stoneText text: connectionProfile stone.
	pathText text: connectionProfile path. 
	userText text: connectionProfile user.
	passwordText text: connectionProfile password
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> versionText [

	^ versionText
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> versionText: anObject [

	versionText := anObject
]
