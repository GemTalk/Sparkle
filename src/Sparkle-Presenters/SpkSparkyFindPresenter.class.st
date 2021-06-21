Class {
	#name : 'SpkSparkyFindPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'items',
		'text',
		'itemList',
		'okButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialize - release' }
SpkSparkyFindPresenter >> accept [

	self application close
]

{ #category : 'initialize - release' }
SpkSparkyFindPresenter >> cancel [

	itemList selectItem: nil. 
	self application close
]

{ #category : 'initialize - release' }
SpkSparkyFindPresenter >> connectPresenters [

	super connectPresenters.
	text whenTextChangedDo: [ :theText | 
		itemList items:
			(items select: [ :item | theText , '*' match: item ]) ]
]

{ #category : 'initialize - release' }
SpkSparkyFindPresenter >> initializePresenters [

	| topBox |
	super initializePresenters.
	self layout: SpkBoxLayout newTopToBottom.
	topBox := SpkBoxLayout newLeftToRight.
	text := self newTextInput.
	topBox
		add: text
		withConstraints: [ :constraints | constraints height: 30 ].
	okButton := self newButton
		            label: 'Accept';
		            action: [self accept].
	topBox add: okButton withConstraints: [ :constraints | 
		constraints
			height: 30;
			width: 100 ].
	self layout add: topBox.
	itemList := self newList.
	self layout add: itemList
]

{ #category : 'initialize - release' }
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

{ #category : 'actions' }
SpkSparkyFindPresenter >> selectDown [

	itemList selectedItem ifNil: [ ^ itemList selectIndex: 1 ].
	itemList selectIndex: (itemList selection selectedIndex + 1 min: itemList items size)
]

{ #category : 'actions' }
SpkSparkyFindPresenter >> selectUp [

	itemList selectedItem ifNil: [ 
		^ itemList selectIndex: itemList items size ].
	itemList selectIndex: (itemList selection selectedIndex - 1 max: 1)
]

{ #category : 'accessing' }
SpkSparkyFindPresenter >> selectedItem [

	^itemList selectedItem
]

{ #category : 'initialize - release' }
SpkSparkyFindPresenter >> shortCuts [

	| shortCuts |
	shortCuts := Dictionary new.
	shortCuts at: Character escape put: [ self cancel ].
	shortCuts at: Character arrowDown put: [ self selectDown ].
	shortCuts at: Character arrowUp put: [ self selectUp ].
	^ shortCuts
]
