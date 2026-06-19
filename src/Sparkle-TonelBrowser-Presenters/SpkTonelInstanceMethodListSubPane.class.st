Class {
	#name : 'SpkTonelInstanceMethodListSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Subpanes',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Subpanes'
}

{ #category : 'api' }
SpkTonelInstanceMethodListSubPane >> listItems [

	^ model instanceMethodServices
]

{ #category : 'as yet unclassified' }
SpkTonelInstanceMethodListSubPane >> listLabelString [

	^ 'Instance methods'
]
