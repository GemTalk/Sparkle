Class {
	#name : 'SpkGciConnectionPresenter',
	#superclass : 'SpkConnectionPresenter',
	#instVars : [
		'versionText',
		'netldiText',
		'stoneText'
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
SpkGciConnectionPresenter >> initializePresenters [

	super initializePresenters.
	self initializeVersionPresenter.
	self initializeStonePresenter.
	self initializeNetldiPresenter.
	self initializeButtons. 
	self setFocusOrder
	
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializeStonePresenter [

	self layout
		add: (self newLabel label: 'Stone:')
		withConstraints: [ :constraints | constraints height: 20 ].
	stoneText  := self newTextInput.
	self layout
		add: stoneText
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkGciConnectionPresenter >> initializeVersionPresenter [

	self layout
		add: (self newLabel label: 'Version:')
		withConstraints: [ :constraints | constraints height: 20 ].
	versionText := self newTextInput.
	self layout
		add: versionText
		withConstraints: [ :constraints | constraints height: 30 ]
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
