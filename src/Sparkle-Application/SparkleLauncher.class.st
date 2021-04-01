Class {
	#name : 'SparkleLauncher',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SparkleLauncher class >> applicationName [ 
	^ 'Sparkle Connect'
]

{ #category : 'examples' }
SparkleLauncher class >> example [ 
	<example>
	self new start
]

{ #category : 'world menu' }
SparkleLauncher class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	"<worldMenu> 
	
	(aBuilder item: #'Sparkle Launcher')
		order: 1.2; 
		icon: nil;  
		parent: #'Browse';
		keyText: 's, p'; 
		help: 'Sparkle is the GemStone interface for Pharo';
		action: [ self new start ]"
]

{ #category : 'running' }
SparkleLauncher >> start [
	(self new: SpkLauncherPresenter) openWithSpec
]
