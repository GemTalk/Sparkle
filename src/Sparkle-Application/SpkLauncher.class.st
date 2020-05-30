Class {
	#name : #SpkLauncher,
	#superclass : #SpPresenter,
	#instVars : [
		'button',
		'service'
	],
	#category : #'Sparkle-Application'
}

{ #category : #specs }
SpkLauncher class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #button;
		yourself
]

{ #category : #accessing }
SpkLauncher >> button [
	^ button
]

{ #category : #initialization }
SpkLauncher >> initializePresenters [
	button := self newButton
		label: 'Launch';
		color: Color red darker darker;
		action: [ self openTextPresenter ];
		yourself.
	self focusOrder add: button.
	service := SpkTextServiceClient new string: 'Hey look, text'
]

{ #category : #initialization }
SpkLauncher >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Embryonic Sparkle Launcher';
		initialExtent: 100 @ 30;
		aboutText: 'Central window of the Pharo IDE for GemStone'
]

{ #category : #TEMPORARY }
SpkLauncher >> openTextPresenter [
	"Exploratory"

	(SpkTextPresenter
		newApplication: application
		owner: self
		model: service) openWithSpec
]
