Class {
	#name : 'SpkSparkyFindPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'items',
		'text',
		'itemList'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkSparkyFindPresenter >> initializePresenters [

	super initializePresenters.
	self layout: SpkBoxLayout newTopToBottom.
	text := self newTextInput.
	self layout add: text.
	itemList := self newList.
	self layout add: itemList
]

{ #category : 'instance creation' }
SpkSparkyFindPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
