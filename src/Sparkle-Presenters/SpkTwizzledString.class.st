Class {
	#name : 'SpkTwizzledString',
	#superclass : 'SpkPresenter',
	#instVars : [
		'pane',
		'twizzledPresenter',
		'textPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkTwizzledString >> bodyString: aString [

	textPresenter text: aString
]

{ #category : 'initialization' }
SpkTwizzledString >> initializePresenters [

	super initializePresenters.
	textPresenter := self newText.
	self layout add: textPresenter.
	twizzledPresenter := self instantiate: SpkTwizzledPresenter.
	twizzledPresenter
		subLayout: self layout;
		showSubLayout: false "Closed by default"
]

{ #category : 'accessing' }
SpkTwizzledString >> labelString: aString [

	twizzledPresenter labelString: aString
]

{ #category : 'accessing' }
SpkTwizzledString >> newLayout [ 
	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkTwizzledString >> pane: anObject [

	pane := anObject.
	twizzledPresenter pane: pane
]
