"
A test model for a multi-select list.

This simple test assumes that no two items compare equal (#'=').
"
Class {
	#name : 'SpkClickyList',
	#superclass : 'SpkModel',
	#instVars : [
		'items',
		'selectedItems',
		'orderedSelectedItems'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'as yet unclassified' }
SpkClickyList class >> withTestContents [
	^ self new
		addTestContents;
		yourself
]

{ #category : 'adding' }
SpkClickyList >> addTestContents [
	items addAll: #('First' 'Second' 'Third' 'Fourth')
]

{ #category : 'initialization' }
SpkClickyList >> computeOrderedSelectedItems [
	orderedSelectedItems := items select: [ :each | 
		                        selectedItems includes: each ]
]

{ #category : 'selection' }
SpkClickyList >> deselectItem: anItem [
	| formerIndex |
	(selectedItems includes: anItem) ifFalse: [ ^ self ].
	formerIndex := self selectionIndexOf: anItem.
	selectedItems remove: anItem.
	self computeOrderedSelectedItems.
	self announce: (SpkItemDeselected forItem: anItem index: formerIndex)
]

{ #category : 'initialization' }
SpkClickyList >> initialize [
	items := OrderedCollection new.
	selectedItems := Set new.
	self computeOrderedSelectedItems
]

{ #category : 'accessing' }
SpkClickyList >> items [
	^ items
]

{ #category : 'accessing' }
SpkClickyList >> items: anObject [
	items := anObject
]

{ #category : 'selection' }
SpkClickyList >> selectItem: anItem [
	(selectedItems includes: anItem) ifTrue: [ ^ self ].
	selectedItems add: anItem.
	self computeOrderedSelectedItems.
	self announce: (SpkItemSelected
			 forItem: anItem
			 index: (self selectionIndexOf: anItem))
]

{ #category : 'accessing' }
SpkClickyList >> selectedItems [
	^ selectedItems
]

{ #category : 'private' }
SpkClickyList >> selectionIndexOf: anItem [
	^ orderedSelectedItems
		  indexOf: anItem
		  ifAbsent: [ self error: 'Item is not selected' ]
]
