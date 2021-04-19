Class {
	#name : 'SpkTwizzledString',
	#superclass : 'Object',
	#instVars : [
		'owner',
		'twizzledPresenter',
		'textPresenter'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'accessing' }
SpkTwizzledString class >> owner: aPresenter [

	^ self new
		  owner: aPresenter;
		  initializePresenters;
		  yourself
]

{ #category : 'accessing' }
SpkTwizzledString >> bodyString: aString [

	textPresenter text: aString
]

{ #category : 'initialization' }
SpkTwizzledString >> initializePresenters [

	textPresenter := owner newText.
	textPresenter beNotEditable.
	twizzledPresenter := owner instantiate: SpkTwizzledPresenter.
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
SpkTwizzledString >> owner: anObject [

	owner := anObject
]

{ #category : 'accessing' }
SpkTwizzledString >> twizzleHelp: aString [

	twizzledPresenter twizzleHelp: aString
]
