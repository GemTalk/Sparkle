Class {
	#name : 'SparkyFind',
	#superclass : 'SpkApplication',
	#instVars : [
		'items'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkyFind class >> example [ 
	<example>
	self new start
]

{ #category : 'instance creation' }
SparkyFind class >> on: items [

	^self new items: items
]

{ #category : 'accessing' }
SparkyFind >> items [

	^ items
]

{ #category : 'accessing' }
SparkyFind >> items: anObject [

	items := anObject
]

{ #category : 'accessing' }
SparkyFind >> start [

	| presenter |
	presenter := self new: SpkSparkyFindPresenter.
	presenter openWithSpec.
	^ presenter
]
