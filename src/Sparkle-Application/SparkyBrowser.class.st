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

{ #category : 'world menu' }
SparkyBrowser class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Sparky Browser')
		order: 0.91; 
		icon: nil;  
		parent: #'Tools'; "This appears as the Library menu option for whatever reason"
		keyText: 'B'; "hot key doesn't work yet" 
		help: 'Sparky is a more traditional system to develop GemStone code';
		action: [ self new start ]
]

{ #category : 'accessing' }
SparkyBrowser >> start [

	| presenter |
	presenter := self new: SpkSparkyBrowserPresenter.
	presenter openWithSpec.
	^ presenter
]
