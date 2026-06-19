Class {
	#name : 'SpkTonelClassMethodListSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Subpanes',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Subpanes'
}

{ #category : 'api' }
SpkTonelClassMethodListSubPane >> listItems [

	^ model classMethodServices
]

{ #category : 'as yet unclassified' }
SpkTonelClassMethodListSubPane >> listLabelString [

	^ 'Class methods'
]
