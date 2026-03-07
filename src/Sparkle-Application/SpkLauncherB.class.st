Class {
	#name : 'SpkLauncherB',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application',
	#package : 'Sparkle-Application'
}

{ #category : 'examples' }
SpkLauncherB class >> example [ 
	<example>
	self new start
]

{ #category : 'world menu' }
SpkLauncherB class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Sparkle Launcher B')
		order: 0.2; 
		icon: nil;  
		parent: #'Tools'; "This appears as the Library menu option for whatever reason"
		help: 'Make connections to GemStone servers';
		action: [ self new start ]
]

{ #category : 'running' }
SpkLauncherB >> start [

	(self new: SpkConnectionListPresenterB) open
]
