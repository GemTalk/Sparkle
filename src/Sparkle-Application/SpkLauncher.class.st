Class {
	#name : #SpkLauncher,
	#superclass : #SpPresenter,
	#instVars : [
		'button'
	],
	#category : #'Sparkle-Application'
}

{ #category : #specs }
SpkLauncher class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #button;
		yourself
]
