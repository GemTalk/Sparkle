Class {
	#name : 'SpkTonelInstanceMethodListSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'api' }
SpkTonelInstanceMethodListSubPane >> listItems [

	^ model instanceMethodServices
]

{ #category : 'as yet unclassified' }
SpkTonelInstanceMethodListSubPane >> listLabelString [

	^ 'Instance methods'
]
