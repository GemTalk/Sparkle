Class {
	#name : 'SpkTonelTextPaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Headers',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Headers'
}

{ #category : 'accessing colors' }
SpkTonelTextPaneHeader >> headerColor [
	"Goldish "
	^ Color fromHexString: '8a6505'
]

{ #category : 'initialization' }
SpkTonelTextPaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label
		addStyle: 'label.paneHeader';
		label: model key.

	labelLayout add: label withConstraints: [ :c | c fill: false ]
]

{ #category : 'accessing' }
SpkTonelTextPaneHeader >> labelString: aString [

	label label: aString
]
