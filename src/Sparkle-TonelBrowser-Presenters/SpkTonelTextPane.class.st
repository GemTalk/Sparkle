Class {
	#name : 'SpkTonelTextPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'codePresenter'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Panes',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Panes'
}

{ #category : 'accessing' }
SpkTonelTextPane >> headerClass [

	^ SpkTonelTextPaneHeader
]

{ #category : 'initialization' }
SpkTonelTextPane >> initializeCodePresenter [

	codePresenter := self instantiate: SpkCodePresenter
]

{ #category : 'initialization' }
SpkTonelTextPane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		initializeCodePresenter.
	self layout add: codePresenter
]

{ #category : 'initialization' }
SpkTonelTextPane >> refreshFromService [
	"Must be sent in the UI thread."

	self header labelString: model key.

	codePresenter text: model value
]
