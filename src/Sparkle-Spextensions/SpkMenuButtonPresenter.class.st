"
A MenuButtonPresenter that refuses to take keyboard focus.
"
Class {
	#name : 'SpkMenuButtonPresenter',
	#superclass : 'SpMenuButtonPresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkMenuButtonPresenter class >> adapterName [

	^ #SpkMenuButtonAdapter
]

{ #category : 'testing' }
SpkMenuButtonPresenter >> canTakeKeyboardFocus [

	^ false
]
