"
SpkBoxLayout is somewhat similar to SpBoxLayout, but has additional capabilities. Also a limitation: it currently only works with a Morphic backend, uses some Sparkle-specific Morphic extensions, and currently mostly ignores what backend has been specified.

The additional capabilities:
- Color defaults to transparent but if set to another color rovides background color for all contained presenters (if they are transparent). Partial transparency probably works.
- Justified alignment is available in the primary direction
- Secondary-direction alignment actually works for presenters that do not by their nature fill the space.
"
Class {
	#name : 'SpkBoxLayout',
	#superclass : 'SpBoxLayout',
	#traits : 'SpkTAlignable',
	#classTraits : 'SpkTAlignable classTrait',
	#instVars : [
		'color'
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
		withConstraints: [ :constraints |  ]
		beforeIndex: children size + 1
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter after: anExistingPresenter [

	self
		add: newPresenter
		beforeIndex: (self indexOfPresenter: anExistingPresenter) + 1
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
		withConstraints: [ :constraints |  ]
		beforeIndex: anInteger
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

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> add: aNameOrPresenter withConstraints: aBlock beforeIndex: anInteger [
	| constraints |
	constraints := self constraintsClass new.
	aBlock value: constraints.
	children add: aNameOrPresenter -> constraints beforeIndex: anInteger.
	self announceChildAdded: aNameOrPresenter beforeIndex: anInteger
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
SpkBoxLayout >> enabled: aBoolean [

	self withAdapterDo: [ :dapt | dapt enabled: aBoolean ]
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
	color := Color transparent.
	children := SpkOrderedDictionary new
]

{ #category : 'removing' }
SpkBoxLayout >> remove: aPresenter [

	| index |
	index := children
		         identityIndexOfKey: aPresenter
		         ifAbsent: [ self error: 'Presenter not found' ].
	self removePresenterAtIndex: index
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
