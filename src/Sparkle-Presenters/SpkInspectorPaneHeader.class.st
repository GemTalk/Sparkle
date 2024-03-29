Class {
	#name : 'SpkInspectorPaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'classLabel',
		'oopLabel'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkInspectorPaneHeader >> classLabel [
	^ classLabel
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> classLabel: anObject [
	classLabel := anObject
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> classMembershipDescription: aString [

	classLabel label: aString
]

{ #category : 'accessing colors' }
SpkInspectorPaneHeader >> headerColor [

	^ Color fromHexString: '2f5531'
]

{ #category : 'initialization' }
SpkInspectorPaneHeader >> initializePresenters [

	super initializePresenters.
	classLabel := self newLabel.
	classLabel
		addStyle: 'label.paneHeader';
		label: model classMembershipDescription.
	oopLabel := self newLabel.
	oopLabel label: model oop hex.

	labelLayout
		add: classLabel withConstraints: [ :c | c fill: false ];
		add: oopLabel withConstraints: [ :c | c fill: false ]
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> menuHelp [

	^ 'select view'
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> oopLabel [
	^ oopLabel
]

{ #category : 'accessing' }
SpkInspectorPaneHeader >> oopLabel: anObject [
	oopLabel := anObject
]
