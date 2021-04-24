"
Not a presenter, but control display of a couple of presenters.
It would be better to be a presenter, but in order for the twizzle to stop taking space when collapsed I need to put stuff in my owner's layout, not have a layout of my own.
"
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

{ #category : 'accessing' }
SpkTwizzledString >> enabled: aBoolean [

	"I'm not a presenter, so I don't inherit this."

	textPresenter ifNotNil: [ :tp | tp enabled: aBoolean ].
	twizzledPresenter ifNotNil: [ :twp | twp enabled: aBoolean ]
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
