Class {
	#name : 'SpkTonelClassFilePaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'initialization' }
SpkTonelClassFilePaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label addStyle: 'label.paneHeader'.

	labelLayout add: label withConstraints: [ :c | c fill: false ]
]

{ #category : 'accessing' }
SpkTonelClassFilePaneHeader >> labelString: aString [

	label label: aString
]
