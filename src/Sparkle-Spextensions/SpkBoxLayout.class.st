"
Gives more control than its superclass over its children. 

The superclass just lets you add: presenters at the end. Here, you can also:

insert: aNameOrPresenter atIndex: newIndex 


"
Class {
	#name : 'SpkBoxLayout',
	#superclass : 'SpBoxLayout',
	#category : 'Sparkle-Spextensions-Spec2'
}

{ #category : 'specs' }
SpkBoxLayout class >> adapterName [

	^ #SpkOrderedAdapter
]

{ #category : 'adding' }
SpkBoxLayout >> add: aNameOrPresenter beforeIndex: anInteger [
	self
		add: aNameOrPresenter
		withConstraints: [ :constraints |  ]
		beforeIndex: anInteger
]

{ #category : 'adding' }
SpkBoxLayout >> add: aNameOrPresenter withConstraints: aBlock beforeIndex: anInteger [
	| constraints |
	constraints := self constraintsClass new.
	aBlock value: constraints.
	children add: aNameOrPresenter -> constraints beforeIndex: anInteger.
	self announceChildAdded: aNameOrPresenter
]

{ #category : 'initialization' }
SpkBoxLayout >> initialize [
	super initialize.
	children := SpkOrderedDictionary new
]
