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
		                     on: model
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> initializeDefinitionSubPane [

	definitionSubPane := self
		                     instantiate: SpkTonelClassDefinitionSubPane
		                     on: model
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> initializeInstanceMethodSubPane [

	instanceMethodSubPane := self
		                         instantiate:
		                         SpkTonelInstanceMethodListSubPane
		                         on: model
]

{ #category : 'initialization' }
SpkTonelClassFilePane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		initializeDefinitionSubPane;
		addSeparator;
		initializeClassMethodSubPane;
		addSeparator;
		initializeInstanceMethodSubPane
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
