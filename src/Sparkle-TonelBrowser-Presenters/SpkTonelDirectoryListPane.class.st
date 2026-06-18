Class {
	#name : 'SpkTonelDirectoryListPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'dewSubPane',
		'stSubPane'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
SpkTonelDirectoryListPane >> headerClass [

	^ SpkTonelDirectoryListPaneHeader
]

{ #category : 'initialization' }
SpkTonelDirectoryListPane >> initializeDewSubPane [

	dewSubPane := self instantiate: SpkTonelDewFileListSubPane on: model.
	dewSubPane initializeTwizzledList
]

{ #category : 'initialization' }
SpkTonelDirectoryListPane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		initializeDewSubPane;
		addSeparator;
		initializeStSubPane
]

{ #category : 'initialization' }
SpkTonelDirectoryListPane >> initializeStSubPane [

	stSubPane := self instantiate: SpkTonelStFileListSubPane on: model.
	stSubPane initializeTwizzledList
]

{ #category : 'initialization' }
SpkTonelDirectoryListPane >> refreshFromService [
	"Must be sent in the UI thread."

	self header labelString: model dirName.
	stSubPane
		ensureList;
		refreshTwizzledList.
	dewSubPane
		ensureList;
		refreshTwizzledList.
	self updateLinkedCoordinates
]

{ #category : 'refreshing' }
SpkTonelDirectoryListPane >> updateLinkedCoordinates [
	"Have two lists, one in each subpane. What a pane."

	| coordinateSuffix |
	coordinateSuffix := dewSubPane updateCoordinatesBasedOn: 0.
	stSubPane updateCoordinatesBasedOn: coordinateSuffix
]
