"
A ButtonPresenter that refuses to take keyboard focus.
"
Class {
	#name : 'SpkButtonPresenter',
	#superclass : 'SpButtonPresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkButtonPresenter class >> adapterName [

	^ #SpkButtonAdapter
]

{ #category : 'testing' }
SpkButtonPresenter >> canTakeKeyboardFocus [

	^ false
]
