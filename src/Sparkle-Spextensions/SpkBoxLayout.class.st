"
SpkBoxLayout is somewhat similar to SpBoxLayout, but has additional capabilities. Also a limitation: it currently only works with a Morphic backend, uses some Sparkle-specific Morphic extensions, and currently mostly ignores what backend has been specified.

The additional capabilities:
- Color defaults to transparent but if set to another color rovides background color for all contained presenters (if they are transparent). Partial transparency probably works.
- Justified alignment is available in the primary direction
- Secondary-direction alignment actually works for presenters that do not by their nature fill the space.
"
Class {
	#name : 'SpkBoxLayout',
	#superclass : 'SpDirectionableLayout',
	#instVars : [
		'color',
		'borderWidth'
	],
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'private' }
SpkBoxLayout >> adapterName [
	^ #SpkBoxAdapter
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter [

	self
		add: aPresenter
		beforeIndex: children size + 1
		withConstraints: [ :constraints |  ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter after: anExistingPresenter [

	self
		add: newPresenter
		after: anExistingPresenter
		withConstraints: [ :c |  ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter after: anExistingPresenter withConstraints: aBlock [

	self
		add: newPresenter
		beforeIndex: (self indexOfPresenter: anExistingPresenter) + 1
		withConstraints: aBlock
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter before: anExistingPresenter [

	self
		add: newPresenter
		beforeIndex: (self indexOfPresenter: anExistingPresenter)
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> add: aNameOrPresenter beforeIndex: anInteger [

	self
		add: aNameOrPresenter
		beforeIndex: anInteger
		withConstraints: [ :c |  ]
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> add: aNameOrPresenter beforeIndex: anInteger withConstraints: aBlock [

	| constraints |
	constraints := self constraintsClass new.
	aBlock value: constraints.
	children add: aNameOrPresenter -> constraints beforeIndex: anInteger.
	self announceChildAdded: aNameOrPresenter beforeIndex: anInteger
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter height: anInteger [

	self
		add: aPresenter
		withConstraints: [ :constraints | constraints height: anInteger ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter width: anInteger [

	self
		add: aPresenter
		withConstraints: [ :constraints | constraints width: anInteger ]
]

{ #category : 'adding' }
SpkBoxLayout >> addLast: aPresenterOrName withConstraints: aBlock [

	"#addLast: and friends have no meaning in this layout. Use #add: variants instead."

	self shouldNotImplement
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> announceChildAdded: aNameOrPresenter beforeIndex: anInteger [
	self presenter ifNotNil: [ 
		self announcer announce: (SpkChildAdded new
				 child: aNameOrPresenter;
				 index: anInteger;
				 yourself) ]
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> announceChildRemoved: aNameOrPresenter atIndex: anInteger [
	self presenter ifNotNil: [ 
		self announcer announce: (SpkChildRemoved new
				 child: aNameOrPresenter;
				 index: anInteger;
				 yourself) ]
]

{ #category : 'initialization' }
SpkBoxLayout >> beHorizontal [

	direction := SpkLayoutDirectionHorizontal uniqueInstance
]

{ #category : 'initialization' }
SpkBoxLayout >> beLeftToRight [

	self beHorizontal
	
]

{ #category : 'initialization' }
SpkBoxLayout >> beTopToBottom [

	self beVertical
]

{ #category : 'initialization' }
SpkBoxLayout >> beVertical [

	direction := SpkLayoutDirectionVertical uniqueInstance
]

{ #category : 'accessing' }
SpkBoxLayout >> borderWidth [
	"Answer the border width defined for the layout (default is zero)"

	^ borderWidth
]

{ #category : 'accessing' }
SpkBoxLayout >> borderWidth: aNumber [
	"Set the border width to be used by the layout"

	borderWidth := aNumber.
	self withAdapterDo: [ :anAdapter | anAdapter updateBorderWidth ]
]

{ #category : 'accessing' }
SpkBoxLayout >> color [

	^ color ifNil: [ color := Color transparent ]
]

{ #category : 'accessing' }
SpkBoxLayout >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
SpkBoxLayout >> constraintsClass [

	^ SpkBoxConstraints
]

{ #category : 'accessing' }
SpkBoxLayout >> direction [

	^ direction
]

{ #category : 'accessing' }
SpkBoxLayout >> enabled: aBoolean [

	self withAdapterDo: [ :dapt | dapt enabled: aBoolean ]
]

{ #category : 'testing' }
SpkBoxLayout >> includesPresenter: aPresenter [

	^ children includesKey: aPresenter
]

{ #category : 'adding' }
SpkBoxLayout >> indexOfPresenter: anExistingPresenter [

	^ children
		  identityIndexOfKey: anExistingPresenter
		  ifAbsent: [ self error: 'Presenter not found' ]
]

{ #category : 'initialization' }
SpkBoxLayout >> initialize [

	super initialize.
	self borderWidth: 0.
	color := Color transparent.
	children := SpkOrderedDictionary new
]

{ #category : 'testing' }
SpkBoxLayout >> isHorizontal [ 
	"Answer true if the layout direction is horizontal"

	^ direction = SpkLayoutDirectionHorizontal uniqueInstance
]

{ #category : 'initialization' }
SpkBoxLayout >> isVertical [ 
	"Answer true if the layout direction is vertical"

	^ self direction = SpkLayoutDirectionVertical uniqueInstance
]

{ #category : 'removing' }
SpkBoxLayout >> remove: aPresenter [

	self
		remove: aPresenter
		ifAbsent: [ self error: 'Presenter not found' ]
]

{ #category : 'removing' }
SpkBoxLayout >> remove: aPresenter ifAbsent: aBlock [

	| index |
	index := children
		         identityIndexOfKey: aPresenter
		         ifAbsent: [ ^ aBlock value ].
	self removePresenterAtIndex: index
]

{ #category : 'removing' }
SpkBoxLayout >> removeAll [

	children removeAll.
	self withAdapterDo: [ :anAdapter | anAdapter removeAll ]
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> removePresenterAtIndex: anInteger [
	| association |
	association := children removeAtIndex: anInteger.
	self announceChildRemoved: association key atIndex: anInteger
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> whenChildrenAddedDo: aBlock [
	"It's really *one* child that has been added, sigh."

	self announcer when: SpkChildAdded do: aBlock
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> whenChildrenRemovedDo: aBlock [
	"It's really *one* child that has been removed, sigh."

	self announcer when: SpkChildRemoved do: aBlock
]
