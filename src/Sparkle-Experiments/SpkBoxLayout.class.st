"
Gives more control than its superclass over its children. 

The superclass just lets you add: presenters at the end. Here, you can also:

insert: aNameOrPresenter atIndex: newIndex 


"
Class {
	#name : 'SpkBoxLayout',
	#superclass : 'SpBoxLayout',
	#category : 'Sparkle-Experiments'
}

{ #category : 'initialization' }
SpkBoxLayout >> initialize [
	super initialize.
	children := SpkOrderedDictionary new
]
