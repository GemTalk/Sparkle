Class {
	#name : 'SpkPaneHeader',
	#superclass : 'SpkHeader',
	#instVars : [
		'mainLayout',
		'dragHandle',
		'linkagePresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkPaneHeader >> closeButtonHelp [

	^ 'Close the pane'
]

{ #category : 'layout' }
SpkPaneHeader >> constraintsBlock [

	^ [ :c | c shouldFillHeight: false ]
]

{ #category : 'layout' }
SpkPaneHeader >> defaultLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkPaneHeader >> dragHandle [
	^ dragHandle
]

{ #category : 'accessing' }
SpkPaneHeader >> dragHandle: anObject [
	dragHandle := anObject
]

{ #category : 'private' }
SpkPaneHeader >> dragHandleWidth [

	^ 16
]

{ #category : 'initialization' }
SpkPaneHeader >> initializePresenters [

	super initializePresenters.
	dragHandle := self newImage
		              image: (self iconNamed: #glamorousGrayCircleEmpty);
		              yourself.

	linkagePresenter := (self instantiate: SpkLinkagePresenter)
		                    color: self headerColor duller;
		                    yourself.

	mainLayout := SpkBoxLayout newHorizontal
		              color: self headerColor;
		              add: dragHandle width: self dragHandleWidth;
		              add: labelLayout;
		              add: menuButton width: self menuButtonWidth;
		              add: closeButton width: self closeButtonWidth;
		              yourself.

	self layout add: mainLayout height: 30
]

{ #category : 'display' }
SpkPaneHeader >> showLinkage: stringOrNil [

	"Show or hide my linkedFrom subpart depending on aBoolean"

	stringOrNil
		ifNil: [ self layout remove: linkagePresenter ifAbsent: [  ] ]
		ifNotNil: [ 
			self layout
				add: linkagePresenter
				withConstraints: linkagePresenter constraintsBlock
				ifPresent: [  ].
			linkagePresenter label: stringOrNil;
				showUnlinkButton: self canUnlink ]
]
