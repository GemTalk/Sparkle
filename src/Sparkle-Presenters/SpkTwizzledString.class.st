Class {
	#name : 'SpkTwizzledString',
	#superclass : 'SpkPresenterWithinPane',
	#instVars : [
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
	twizzledPresenter := self instantiate: SpkTwizzledPresenter.
	twizzledPresenter
		subLayout: textPresenter;
		showSubLayout: false. "Closed by default"
	self layout add: twizzledPresenter
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

	super pane: anObject.
	twizzledPresenter pane: anObject
]
