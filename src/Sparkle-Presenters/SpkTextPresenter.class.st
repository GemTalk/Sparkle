Class {
	#name : #SpkTextPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'textPane',
		'window'
	],
	#category : #'Sparkle-Presenters'
}

{ #category : #specs }
SpkTextPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #textPane;
		yourself
]

{ #category : #'model interaction' }
SpkTextPresenter >> closeWindow [
	"Sent by model when remote window closed."

	window close.
	self unhookFromModel
]

{ #category : #'model interaction' }
SpkTextPresenter >> hookToModel [
	model addDependent: self
]

{ #category : #initialization }
SpkTextPresenter >> initializePresenters [
	textPane := self newText
		whenTextChangedDo: [ self textChanged ];
		yourself.
	self focusOrder add: textPane.
	self hookToModel
]

{ #category : #initialization }
SpkTextPresenter >> initializeWindow: aWindowPresenter [
	window := aWindowPresenter.
	aWindowPresenter
		title: 'Chat';
		aboutText: 'Text from Far Away that might change';
		whenWillCloseDo: [ model localWindowIsClosing.
			self unhookFromModel ]
]

{ #category : #'accessing model' }
SpkTextPresenter >> setModelBeforeInitialization: aDomainObject [
	model := aDomainObject
]

{ #category : #'event handling' }
SpkTextPresenter >> textChanged [
	"I've been edited, let the model reflect that change"

	model string: textPane text asString
]

{ #category : #accessing }
SpkTextPresenter >> textPane [
	^ textPane
]

{ #category : #accessing }
SpkTextPresenter >> textPane: anObject [
	textPane := anObject
]

{ #category : #'model interaction' }
SpkTextPresenter >> unhookFromModel [
	model removeDependent: self
]

{ #category : #'model interaction' }
SpkTextPresenter >> update: anAspect [
	"Text is the only aspect right now"

	textPane
		text: model string asText;
		update
]

{ #category : #'model interaction' }
SpkTextPresenter >> updateFromModel [
	textPane
		text: model string asText;
		update
]
