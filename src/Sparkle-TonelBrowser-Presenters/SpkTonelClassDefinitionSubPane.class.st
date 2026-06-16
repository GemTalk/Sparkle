Class {
	#name : 'SpkTonelClassDefinitionSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'as yet unclassified' }
SpkTonelClassDefinitionSubPane >> contentTypeString [

	^ 'Class Definition'
]

{ #category : 'api' }
SpkTonelClassDefinitionSubPane >> listItems [

	^ model classPropertyServices
]
