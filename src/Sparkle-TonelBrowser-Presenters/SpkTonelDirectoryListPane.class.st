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
	self layout add: dewSubPane
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
	self layout add: stSubPane
]

{ #category : 'initialization' }
SpkTonelDirectoryListPane >> refreshFromService [
	"Must be sent in the UI thread."

	self header labelString: model dirName.
	stSubPane refreshTwizzledList.
	dewSubPane refreshTwizzledList
]
