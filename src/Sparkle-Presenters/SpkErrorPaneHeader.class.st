Class {
	#name : 'SpkErrorPaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing colors' }
SpkErrorPaneHeader >> headerColor [

	^ Color fromHexString: '802020'
]

{ #category : 'accessing colors' }
SpkErrorPaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label addStyle: 'label.paneHeader'.

	labelLayout add: label withConstraints: [ :c | c fill: false ].

	self layout
		color: self headerColor;
		add: dragHandle width: self dragHandleWidth;
		add: labelLayout;
		add: menuButton width: self menuButtonWidth;
		add: closeButton width: self closeButtonWidth
]

{ #category : 'accessing' }
SpkErrorPaneHeader >> label [

	^ label
]

{ #category : 'accessing' }
SpkErrorPaneHeader >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
SpkErrorPaneHeader >> labelString: aString [

	label label: aString
]
