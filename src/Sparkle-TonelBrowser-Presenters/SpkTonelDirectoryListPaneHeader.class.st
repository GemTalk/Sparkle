Class {
	#name : 'SpkTonelDirectoryListPaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'accessing colors' }
SpkTonelDirectoryListPaneHeader >> headerColor [
	"Kinda blue"
	^ Color fromHexString: '3030A0'
]

{ #category : 'initialization' }
SpkTonelDirectoryListPaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label
		addStyle: 'label.paneHeader';
		label: model dirName.

	labelLayout add: label withConstraints: [ :c | c fill: false ]
]

{ #category : 'accessing' }
SpkTonelDirectoryListPaneHeader >> label [

	^ label
]

{ #category : 'accessing' }
SpkTonelDirectoryListPaneHeader >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
SpkTonelDirectoryListPaneHeader >> labelString: aString [

	label label: aString
]
