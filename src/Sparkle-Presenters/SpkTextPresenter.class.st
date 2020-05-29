Class {
	#name : #SpkTextPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'text',
		'model'
	],
	#category : #'Sparkle-Presenters'
}

{ #category : #specs }
SpkTextPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #text;
		yourself
]

{ #category : #'as yet unclassified' }
SpkTextPresenter >> hookToModel [
	model addSubscriber: self.
	self updateFromModel
]

{ #category : #initialization }
SpkTextPresenter >> initializePresenters [
	text := self newText
		beNotEditable;
		yourself.
	self focusOrder add: text.
	self hookToModel
]

{ #category : #initialization }
SpkTextPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Some Text';
		aboutText: 'Text from Far Away that might change'
]

{ #category : #'accessing model' }
SpkTextPresenter >> setModelBeforeInitialization: aDomainObject [
	model := aDomainObject
]

{ #category : #accessing }
SpkTextPresenter >> text [
	^ text
]

{ #category : #accessing }
SpkTextPresenter >> text: anObject [
	text := anObject
]

{ #category : #'as yet unclassified' }
SpkTextPresenter >> updateFromModel [
	text
		text: model string;
		update
]
