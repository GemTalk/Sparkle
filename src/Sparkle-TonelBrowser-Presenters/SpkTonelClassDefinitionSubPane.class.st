Class {
	#name : 'SpkTonelClassDefinitionSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'api' }
SpkTonelClassDefinitionSubPane >> listItems [

	^ model classPropertyServices
]

{ #category : 'as yet unclassified' }
SpkTonelClassDefinitionSubPane >> listLabelString [

	^ 'Class Definition'
]
