"
A test model for a multi-select list.

This simple test assumes that no two items compare equal (#'=').
"
Class {
	#name : 'SpkMultiSelectList',
	#superclass : 'Object',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'items',
		'selectedItems',
		'orderedSelectedItems'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'initialization' }
SpkMultiSelectList >> computeOrderedSelectedItems [
	orderedSelectedItems := items select: [ :each | 
		                        selectedItems includes: each ]
]

{ #category : 'selection' }
SpkMultiSelectList >> deselectItem: anItem [
	| formerIndex |
	(selectedItems includes: anItem) ifFalse: [ ^ self ].
	formerIndex := self selectionIndexOf: anItem.
	selectedItems remove: anItem.
	self computeOrderedSelectedItems.
	self announce: (SpkItemDeselected forItem: anItem index: formerIndex)
]

{ #category : 'initialization' }
SpkMultiSelectList >> initialize [
	items := OrderedCollection new.
	selectedItems := Set new.
	self computeOrderedSelectedItems
]

{ #category : 'accessing' }
SpkMultiSelectList >> items [
	^ items
]

{ #category : 'selection' }
SpkMultiSelectList >> selectItem: anItem [
	(selectedItems includes: anItem) ifTrue: [ ^ self ].
	selectedItems add: anItem.
	self computeOrderedSelectedItems.
	self announce: (SpkItemSelected
			 forItem: anItem
			 index: (self selectionIndexOf: anItem))
]

{ #category : 'accessing' }
SpkMultiSelectList >> selectedItems [
	^ selectedItems
]

{ #category : 'private' }
SpkMultiSelectList >> selectionIndexOf: anItem [
	^ orderedSelectedItems
		  indexOf: anItem
		  ifAbsent: [ self error: 'Item is not selected' ]
]
