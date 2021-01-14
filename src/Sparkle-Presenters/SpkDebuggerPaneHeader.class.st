Class {
	#name : 'SpkDebuggerPaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'processNameLabel',
		'oopLabel'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing colors' }
SpkDebuggerPaneHeader >> headerColor [

	^ Color fromHexString: '802020'
]

{ #category : 'accessing colors' }
SpkDebuggerPaneHeader >> initializePresenters [

	super initializePresenters.
	processNameLabel := self newLabel.
	processNameLabel
		addStyle: 'label.paneHeader';
		label: model processDescription.
	oopLabel := self newLabel.
	oopLabel label: model processOop hex.

	labelLayout
		add: processNameLabel withConstraints: [ :c | c fill: false ];
		add: oopLabel withConstraints: [ :c | c fill: false ].

	self layout
		color: self headerColor;
		add: dragHandle width: self dragHandleWidth;
		add: labelLayout;
		add: menuButton width: self menuButtonWidth;
		add: closeButton width: self closeButtonWidth
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> oopLabel [

	^ oopLabel
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> oopLabel: anObject [

	oopLabel := anObject
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> processNameLabel [

	^ processNameLabel
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> processNameLabel: anObject [

	processNameLabel := anObject
]
