Class {
	#name : 'SparkyBrowser',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkyBrowser class >> example [ 
	<example>
	self new start
]

{ #category : 'accessing' }
SparkyBrowser >> start [

	| presenter |
	presenter := self new: SpkSparkyBrowserPresenter.
	presenter openWithSpec.
	^ presenter
]
