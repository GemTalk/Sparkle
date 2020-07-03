Class {
	#name : 'SpkClickyList',
	#superclass : 'Model',
	#instVars : [
		'items',
		'itemsSelected'
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
SpkClickyList >> initialize [
	items := OrderedCollection new.
	itemsSelected := Set new
]

{ #category : 'accessing' }
SpkClickyList >> items [
	^ items
]

{ #category : 'accessing' }
SpkClickyList >> items: anObject [
	items := anObject
]
