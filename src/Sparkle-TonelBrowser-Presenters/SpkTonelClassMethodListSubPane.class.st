Class {
	#name : 'SpkTonelClassMethodListSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'api' }
SpkTonelClassMethodListSubPane >> listItems [

	^ model classMethodServices
]

{ #category : 'as yet unclassified' }
SpkTonelClassMethodListSubPane >> listLabelString [

	^ 'Class methods'
]
