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
		label: self processDescription.
	oopLabel := self newLabel.
	oopLabel label: model processIdentifier hex.

	labelLayout
		add: processNameLabel withConstraints: [ :c | c fill: false ];
		add: oopLabel withConstraints: [ :c | c fill: false ]
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> menuHelp [

	^ 'nothing here yet'
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> oopLabel [

	^ oopLabel
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> oopLabel: anObject [

	oopLabel := anObject
]

{ #category : 'private' }
SpkDebuggerPaneHeader >> processDescription [

	^ 'GsProcess ' , model processName , ' @ '
	  , model processPriority printString
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> processNameLabel [

	^ processNameLabel
]

{ #category : 'accessing' }
SpkDebuggerPaneHeader >> processNameLabel: anObject [

	processNameLabel := anObject
]
