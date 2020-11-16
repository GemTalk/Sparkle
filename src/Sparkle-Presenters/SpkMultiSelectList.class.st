"
A model for a multi-select list.

This simple class assumes that no two items compare equal (#'=').
"
Class {
	#name : 'SpkMultiSelectList',
	#superclass : 'Object',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'items',
		'selectedItems'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'adding' }
SpkMultiSelectList >> add: anItem [

	"Add an unselected item at the end of the list."

	items add: anItem
]

{ #category : 'adding' }
SpkMultiSelectList >> addAll: aCollection [

	"Add unselected items at the end of the list."

	items addAll: aCollection
]

{ #category : 'accessing' }
SpkMultiSelectList >> at: anIndex [

	^ items at: anIndex
]

{ #category : 'accessing' }
SpkMultiSelectList >> at: anIndex ifAbsent: aBlock [

	^ items at: anIndex ifAbsent: aBlock
]

{ #category : 'selection' }
SpkMultiSelectList >> deselectItem: anItem [

	| index |
	(selectedItems includes: anItem) ifFalse: [ ^ self ].
	index := items indexOf: anItem.
	selectedItems remove: anItem.
	self announce: (SpkItemDeselected forItem: anItem index: index)
]

{ #category : 'initialization' }
SpkMultiSelectList >> initialize [

	items := OrderedCollection new.
	selectedItems := Set new
]

{ #category : 'accessing' }
SpkMultiSelectList >> items [
	^ items
]

{ #category : 'selection' }
SpkMultiSelectList >> selectItem: anItem [

	(selectedItems includes: anItem) ifTrue: [ ^ self ].
	selectedItems add: anItem.
	self announce:
		(SpkItemSelected forItem: anItem index: (items indexOf: anItem))
]

{ #category : 'selection' }
SpkMultiSelectList >> selectedIndexes: newIndexes [

	"Something has been selected or deselected. Figure out what and announce it.
	It falls to us to translate between selected indexes and selected objects."

	| previouslySelectedItems nowSelectedItems newlySelectedItems newlyDeselectedItems |
	previouslySelectedItems := selectedItems.
	nowSelectedItems := newIndexes collect: [ :i | items at: i ].
	newlySelectedItems := nowSelectedItems difference:
		                      previouslySelectedItems.
	newlyDeselectedItems := previouslySelectedItems difference:
		                        nowSelectedItems.
	newlySelectedItems do: [ :each | self selectItem: each ].
	newlyDeselectedItems do: [ :each | self deselectItem: each ]
]

{ #category : 'accessing' }
SpkMultiSelectList >> selectedItems [
	^ selectedItems
]

{ #category : 'accessing' }
SpkMultiSelectList >> size [

	^ items size
]
