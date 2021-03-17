Class {
	#name : 'SpkTwizzledString',
	#superclass : 'SpkPresenter',
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
	textPresenter beNotEditable.
	twizzledPresenter := self instantiate: SpkTwizzledPresenter.
	twizzledPresenter
		subPresenter: textPresenter;
		showSubPresenter: false "Closed by default"
]

{ #category : 'accessing' }
SpkTwizzledString >> labelString: aString [

	twizzledPresenter labelString: aString
]

{ #category : 'accessing' }
SpkTwizzledString >> layout [
  
	^ owner layout
]

{ #category : 'accessing' }
SpkTwizzledString >> newLayout [

	"I use my owner's layout for the twizzledPresenter"

	self shouldNotImplement
]
