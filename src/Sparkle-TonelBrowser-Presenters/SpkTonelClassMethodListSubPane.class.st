Class {
	#name : 'SpkTonelClassMethodListSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'as yet unclassified' }
SpkTonelClassMethodListSubPane >> contentTypeString [

	^ 'Class methods'
]

{ #category : 'api' }
SpkTonelClassMethodListSubPane >> listItems [

	^ model classMethodServices
]
