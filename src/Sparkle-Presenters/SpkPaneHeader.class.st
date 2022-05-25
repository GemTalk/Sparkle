Class {
	#name : 'SpkPaneHeader',
	#superclass : 'SpkHeader',
	#instVars : [
		'mainLayout',
		'linkedFrom',
		'dragHandle'
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

	linkedFrom := self instantiate: SpkLinkedFromPresenter.

	mainLayout := SpkBoxLayout newHorizontal
		              color: self headerColor;
		              add: dragHandle width: self dragHandleWidth;
		              add: labelLayout;
		              add: menuButton width: self menuButtonWidth;
		              add: closeButton width: self closeButtonWidth;
		              yourself.

	self layout add: mainLayout withConstraints: [ :c | c height: 30 ]
]

{ #category : 'display' }
SpkPaneHeader >> showLinkedFrom: aBoolean [

	"Show or hide my linkedFrom subpart depending on aBoolean"

	aBoolean
		ifTrue: [ 
			self layout
				add: linkedFrom
				withConstraints: linkedFrom constraintsBlock
				ifPresent: [  ] ]
		ifFalse: [ self layout remove: linkedFrom ifAbsent: [  ] ]
]
