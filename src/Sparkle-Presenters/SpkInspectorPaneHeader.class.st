Class {
	#name : 'SpkInspectorPaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'classLabel',
		'oopLabel'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing colors' }
SpkInspectorPaneHeader class >> headerColor [

	^ Color fromHexString: '2f5531'
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> classLabel [
	^ classLabel
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> classLabel: anObject [
	classLabel := anObject
]

{ #category : 'initialization' }
SpkInspectorPaneHeader >> initializePresenters [

	super initializePresenters.
	classLabel := self newLabel.
	classLabel
		emphasis: TextEmphasis bold;
		label: model classMembershipDescription.
	oopLabel := self newLabel.
	oopLabel label: model oop hex.

	labelLayout
		add: classLabel withConstraints: [ :c | 
			c
				hAlignStart;
				fill: false;
				yourself ];
		add: oopLabel withConstraints: [ :c | 
		c
			hAlignEnd;
			fill: false;
			yourself ].

	self layout
		color: self class headerColor;
		add: dragHandle width: self dragHandleWidth;
		add: labelLayout;
		add: menuButton width: self menuButtonWidth;
		add: closeButton width: self closeButtonWidth
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> oopLabel [
	^ oopLabel
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> oopLabel: anObject [
	oopLabel := anObject
]
