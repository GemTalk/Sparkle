Class {
	#name : 'SpkPresenterWithinPane',
	#superclass : 'SpkPresenter',
	#instVars : [
		'pane'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkPresenterWithinPane >> nonChildSlotNames [

	^ super nonChildSlotNames , #( #pane )
]

{ #category : 'accessing' }
SpkPresenterWithinPane >> pane: anObject [

	pane := anObject
]
