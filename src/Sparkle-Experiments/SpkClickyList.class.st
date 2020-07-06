"
A test model for a multi-select list.

This simple test assumes that no two items compare equal (#'=').
"
Class {
	#name : 'SpkClickyList',
	#superclass : 'Object',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'announcer',
		'items',
		'selectedItems'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'as yet unclassified' }
SpkClickyList class >> withTestContents [
	^ self new
		addTestContents;
		yourself
]

{ #category : 'private' }
SpkClickyList >> _announcer [
	"Private"

	^ announcer
]

{ #category : 'private' }
SpkClickyList >> _announcer: anObject [
	"Private"

	^ announcer := anObject
]

{ #category : 'adding' }
SpkClickyList >> addTestContents [
	items addAll: #('First' 'Second' 'Third' 'Fourth')
]

{ #category : 'selection' }
SpkClickyList >> deselectItem: anItem [
	(selectedItems includes: anItem)
		ifFalse: [ ^ self ].
	selectedItems remove: anItem.
	self announce: (SpkItemDeselected forItem: anItem)
]

{ #category : 'initialization' }
SpkClickyList >> initialize [
	items := OrderedCollection new.
	selectedItems := Set new
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
	(selectedItems includes: anItem)
		ifTrue: [ ^ self ].
	selectedItems add: anItem.
	self announce: (SpkItemSelected forItem: anItem)
]

{ #category : 'accessing' }
SpkClickyList >> selectedItems [
	^ selectedItems
]
