Class {
	#name : 'SpkLauncher',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application',
	#package : 'Sparkle-Application'
}

{ #category : 'examples' }
SpkLauncher class >> example [ 
	<example>
	self new start
]

{ #category : 'world menu' }
SpkLauncher class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Sparkle Launcher')
		order: 0.9; 
		icon: nil;  
		parent: #'Tools'; "This appears as the Library menu option for whatever reason"
		help: 'Make connections to GemStone servers';
		action: [ self new start ]
]

{ #category : 'running' }
SpkLauncher >> start [

	(self new: SpkConnectionListPresenter) open
]
