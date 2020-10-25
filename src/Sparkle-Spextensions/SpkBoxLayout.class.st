Class {
	#name : 'SpkBoxLayout',
	#superclass : 'SpBoxLayout',
	#instVars : [
		'color'
	],
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'private' }
SpkBoxLayout >> adapterName [
	^ #SpkBoxAdapter
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> add: aNameOrPresenter beforeIndex: anInteger [
	self
		add: aNameOrPresenter
		withConstraints: [ :constraints |  ]
		beforeIndex: anInteger
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter width: widthInteger beforeIndex: indexInteger [

	self
		add: aPresenter
		withConstraints: [ :constraints | constraints width: widthInteger ]
		beforeIndex: indexInteger
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
SpkBoxLayout >> addLast: aPresenterOrName [
	self add: aPresenterOrName beforeIndex: children size + 1
]

{ #category : 'adding' }
SpkBoxLayout >> addLast: aPresenterOrName withConstraints: aBlock [

	self
		add: aPresenterOrName
		withConstraints: aBlock
		beforeIndex: children size + 1
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

{ #category : 'accessing' }
SpkBoxLayout >> color [

	^ color ifNil: [ color := Color transparent ]
]

{ #category : 'accessing' }
SpkBoxLayout >> color: anObject [

	color := anObject
]

{ #category : 'as yet unclassified' }
SpkBoxLayout >> constraintsClass [

	^ SpkBoxConstraints
]

{ #category : 'initialization' }
SpkBoxLayout >> initialize [
	super initialize.
	children := SpkOrderedDictionary new
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
