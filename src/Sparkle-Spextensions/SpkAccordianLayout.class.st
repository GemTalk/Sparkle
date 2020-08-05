"
Gives more control than its superclass over its children. 

The superclass just lets you add: presenters at the end. Here, you can also:

insert: aNameOrPresenter atIndex: newIndex 


"
Class {
	#name : 'SpkAccordianLayout',
	#superclass : 'SpkBoxLayout',
	#category : 'Sparkle-Spextensions-Spec2'
}

{ #category : 'private' }
SpkAccordianLayout >> adapterName [
	^ #SpkAccordianAdapter
]

{ #category : 'adding/removing presenters' }
SpkAccordianLayout >> add: aNameOrPresenter beforeIndex: anInteger [
	self
		add: aNameOrPresenter
		withConstraints: [ :constraints |  ]
		beforeIndex: anInteger
]

{ #category : 'adding/removing presenters' }
SpkAccordianLayout >> add: aNameOrPresenter withConstraints: aBlock beforeIndex: anInteger [
	| constraints |
	constraints := self constraintsClass new.
	aBlock value: constraints.
	children add: aNameOrPresenter -> constraints beforeIndex: anInteger.
	self announceChildAdded: aNameOrPresenter beforeIndex: anInteger
]

{ #category : 'adding' }
SpkAccordianLayout >> addLast: aPresenterOrName [
	self add: aPresenterOrName beforeIndex: children size + 1
]

{ #category : 'adding/removing presenters' }
SpkAccordianLayout >> announceChildAdded: aNameOrPresenter beforeIndex: anInteger [
	self presenter ifNotNil: [ 
		self announcer announce: (SpkChildAdded new
				 child: aNameOrPresenter;
				 index: anInteger;
				 yourself) ]
]

{ #category : 'adding/removing presenters' }
SpkAccordianLayout >> announceChildRemoved: aNameOrPresenter atIndex: anInteger [
	self presenter ifNotNil: [ 
		self announcer announce: (SpkChildRemoved new
				 child: aNameOrPresenter;
				 index: anInteger;
				 yourself) ]
]

{ #category : 'initialization' }
SpkAccordianLayout >> initialize [
	super initialize.
	children := SpkOrderedDictionary new
]

{ #category : 'adding/removing presenters' }
SpkAccordianLayout >> removePresenterAtIndex: anInteger [
	| association |
	association := children removeAtIndex: anInteger.
	self announceChildRemoved: association key atIndex: anInteger
]

{ #category : 'adding/removing presenters' }
SpkAccordianLayout >> whenChildrenAddedDo: aBlock [
	"It's really *one* child that has been added, sigh."

	self announcer when: SpkChildAdded do: aBlock
]

{ #category : 'adding/removing presenters' }
SpkAccordianLayout >> whenChildrenRemovedDo: aBlock [
	"It's really *one* child that has been removed, sigh."

	self announcer when: SpkChildRemoved do: aBlock
]
