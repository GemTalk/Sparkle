Class {
	#name : 'SpkTonelInstanceMethodListSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'as yet unclassified' }
SpkTonelInstanceMethodListSubPane >> contentTypeString [

	^ 'Instance methods'
]

{ #category : 'api' }
SpkTonelInstanceMethodListSubPane >> listItems [

	^ model instanceMethodServices
]
