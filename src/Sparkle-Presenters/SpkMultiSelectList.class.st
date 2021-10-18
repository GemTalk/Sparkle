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
		'selectedItems',
		'pane'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'adding' }
SpkMultiSelectList >> add: anItem [

	"Add an unselected item at the end of the list."

	items add: anItem.
	anItem index: items size
]

{ #category : 'adding' }
SpkMultiSelectList >> addAll: aCollection [

	"Add unselected items at the end of the list."

	aCollection do: [ :each | self add: each ]
]

{ #category : 'accessing' }
SpkMultiSelectList >> at: anIndex [

	^ items at: anIndex
]

{ #category : 'accessing' }
SpkMultiSelectList >> at: anIndex ifAbsent: aBlock [

	^ items at: anIndex ifAbsent: aBlock
]

{ #category : 'accessing' }
SpkMultiSelectList >> column [

	^ pane column
]

{ #category : 'selection' }
SpkMultiSelectList >> deselectItem: anItem [

	| index |
	(selectedItems includes: anItem) ifFalse: [ ^ self ].
	index := items indexOf: anItem.
	selectedItems remove: anItem.
	self announce: (SpkItemDeselected forItem: anItem index: index)
]

{ #category : 'as yet unclassified' }
SpkMultiSelectList >> deselectItemsBeyondIndex: lastIndexToKeep [

	self deselectItemsFrom: lastIndexToKeep + 1 to: items size
]

{ #category : 'as yet unclassified' }
SpkMultiSelectList >> deselectItemsFrom: startIndex to: lastIndex [
	"It is acceptable for either or both given indices to
	be out of normal range. Negative integers are also OK."

	(startIndex max: 1) to: (lastIndex min: items size) do: [ :i | 
		| item |
		item := items at: i.
		(selectedItems includes: item) ifTrue: [ self deselectItem: item ] ]
]

{ #category : 'as yet unclassified' }
SpkMultiSelectList >> deselectItemsThroughIndex: lastIndexToDeselect [

	self deselectItemsFrom: 1 to: lastIndexToDeselect
]

{ #category : 'as yet unclassified' }
SpkMultiSelectList >> ensureFirstItemSelected [

	"If the first item is not selected, select it."

	| anItem |
	self isEmpty ifTrue: [ ^ self ].
	anItem := self firstItem.
	(self itemIsSelected: anItem) ifFalse: [ self selectItem: anItem ]
]

{ #category : 'accessing' }
SpkMultiSelectList >> firstItem [

	"Sender must ensure that list is not empty"

	^ items first
]

{ #category : 'initialization' }
SpkMultiSelectList >> initialize [

	items := OrderedCollection new.
	selectedItems := Set new
]

{ #category : 'testing' }
SpkMultiSelectList >> isEmpty [ 
	^ items isEmpty
]

{ #category : 'as yet unclassified' }
SpkMultiSelectList >> itemIsSelected: anItem [

	^ selectedItems includes: anItem
]

{ #category : 'accessing' }
SpkMultiSelectList >> itemWithModel: modelObject [

	"Find and answer the list item having the given model.
	Report error if the number of such models is ~= 1."

	| results |
	results := items select: [ :item | item model == modelObject ].
	results size = 1 ifFalse: [ 
		self error: 'Item not found or not unique.' ].
	^ results first
]

{ #category : 'accessing' }
SpkMultiSelectList >> items [
	^ items
]

{ #category : 'accessing' }
SpkMultiSelectList >> itemsWithLinkedPanes [

	^items select: [:item | item linkedPane notNil]
]

{ #category : 'accessing' }
SpkMultiSelectList >> linkedPanes [

	^ items
		  collect: [ :item | item linkedPane ]
		  thenSelect: [ :aPane | aPane notNil ]
]

{ #category : 'accessing' }
SpkMultiSelectList >> pane: anObject [

	pane := anObject
]

{ #category : 'as yet unclassified' }
SpkMultiSelectList >> refreshFromServices: services [

	"Build a new list of items, keeping by identity any items for the identical model."

	| newItems itemsDictionary |
	newItems := OrderedCollection new.
	itemsDictionary := IdentityDictionary new: items size.
	items do: [:each |
		itemsDictionary
			at: each model
			ifPresent: [self error: 'Internal error: there should not be more than one item with the same model.']
			ifAbsentPut: [each]].
	services do: [ :aService | 
		| item |
		item := itemsDictionary at: aService ifAbsent: [nil].
		item == nil
			ifFalse: [
				newItems add: item.
				item index: newItems size ]
			ifTrue: [ 
				item := SpkMultiSelectListItem new.
				newItems add: item.
				item
					index: newItems size;
					list: self;
					model: aService ] ].
	"If there are any selected items that are no longer in the list, deselect them."
	selectedItems copy do: [ :item | 
		(newItems identityIncludes: item) ifFalse: [ 
			self deselectItem: item ] ].
	items := newItems
]

{ #category : 'selection' }
SpkMultiSelectList >> selectItem: anItem [

	(selectedItems includes: anItem) ifTrue: [ ^ self ].
	selectedItems add: anItem.
	self announce:
		(SpkItemSelected forItem: anItem index: (items indexOf: anItem))
]

{ #category : 'api-selection' }
SpkMultiSelectList >> selectedIndexes [

	"Answer collection the indexes of all selected items"

	| indexes |
	indexes := OrderedCollection new.
	items withIndexDo: [ :each :index | 
		(selectedItems includes: each) ifTrue: [ indexes add: index ] ].
	^ indexes
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
