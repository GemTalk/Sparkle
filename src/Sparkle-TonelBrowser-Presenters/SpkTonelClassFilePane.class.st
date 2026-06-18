Class {
	#name : 'SpkTonelClassFilePane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'definitionSubPane',
		'instanceMethodSubPane',
		'classMethodSubPane'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
SpkTonelClassFilePane >> headerClass [

	^ SpkTonelClassFilePaneHeader
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> initializeClassMethodSubPane [

	classMethodSubPane := self
		                      instantiate: SpkTonelClassMethodListSubPane
		                      on: model.
	classMethodSubPane ensureList.
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> initializeDefinitionSubPane [

	definitionSubPane := self
		                     instantiate: SpkTonelClassDefinitionSubPane
		                     on: model.
	definitionSubPane ensureList
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> initializeInstanceMethodSubPane [

	instanceMethodSubPane := self
		                         instantiate:
		                         SpkTonelInstanceMethodListSubPane
		                         on: model.
	instanceMethodSubPane ensureList
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		addSeparator;
		initializeDefinitionSubPane;
		addSeparator;
		initializeClassMethodSubPane;
		addSeparator;
		initializeInstanceMethodSubPane
]

{ #category : 'refreshing' }
SpkTonelClassFilePane >> refreshFromServer [

	model refreshFromServer
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> refreshFromService [
	"Must be sent in the UI thread."

	self header labelString: model displayName.
	definitionSubPane
		ensureList;
		refreshTwizzledList.
	classMethodSubPane
		ensureList;
		refreshTwizzledList.
	instanceMethodSubPane
		ensureList;
		refreshTwizzledList
]
