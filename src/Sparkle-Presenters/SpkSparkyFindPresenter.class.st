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
SpkSparkyFindPresenter >> connectPresenters [

	super connectPresenters.
	text whenTextChangedDo: [ :theText | 
		itemList items:
			(items select: [ :item | theText , '*' match: item ]) ]
]

{ #category : 'initialization' }
SpkSparkyFindPresenter >> initializePresenters [

	super initializePresenters.
	self layout: SpkBoxLayout newTopToBottom.
	text := self newTextInput.
	self layout add: text.
	itemList := self newList.
	self layout add: itemList.

]

{ #category : 'initialization' }
SpkSparkyFindPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparky Find'.
	self shortCuts keysAndValuesDo: [ :key :value | 
		aWindowPresenter bindKeyCombination: key toAction: value ]
]

{ #category : 'accessing' }
SpkSparkyFindPresenter >> items [

	^ items
]

{ #category : 'accessing' }
SpkSparkyFindPresenter >> items: array [

	items := array.
	itemList items: items. 
]

{ #category : 'instance creation' }
SpkSparkyFindPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'initialization' }
SpkSparkyFindPresenter >> shortCuts [

	| shortCuts |
	shortCuts := Dictionary new.
	shortCuts at: Character escape put: [ self application close ].
	^ shortCuts
]
