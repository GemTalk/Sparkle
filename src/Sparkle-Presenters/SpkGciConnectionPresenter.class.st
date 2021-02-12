Class {
	#name : 'SpkGciConnectionPresenter',
	#superclass : 'SpkConnectionPresenter',
	#instVars : [
		'versionText',
		'netldiText',
		'stoneText',
		'pathText'
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
		                 action: [ self add ].
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
	stoneText := self newTextInput.
	inputBox
		add: stoneText
		withConstraints: [ :constraints | constraints height: 30 ].
	netldiText := self newTextInput.
	inputBox
		add: netldiText
		withConstraints: [ :constraints | constraints height: 30 ].
	versionText := self newTextInput.
	inputBox 
		add: versionText
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
		add: versionText;
		add: stoneText;
		add: netldiText
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
		netldi: netldiText text
]

{ #category : 'actions' }
SpkGciConnectionPresenter >> updateGUI [

	super updateGUI ifFalse:[^false]. 
	versionText text: connectionProfile version.
	netldiText text: connectionProfile netldi.
	stoneText text: connectionProfile stone
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> versionText [

	^ versionText
]

{ #category : 'accessing' }
SpkGciConnectionPresenter >> versionText: anObject [

	versionText := anObject
]
