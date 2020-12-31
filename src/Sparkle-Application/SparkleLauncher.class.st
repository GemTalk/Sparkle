Class {
	#name : 'SparkleLauncher',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SparkleLauncher class >> applicationName [ 
	^ 'Sparkle Connect'
]

{ #category : 'world menu' }
SparkleLauncher class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Sparkle Launcher')
		order: 0.8; 
		icon: nil;  
		parent: #'Tools';
		keyText: 's, p'; "hot key doesn't work yet" 
		help: 'Sparke is the GemStone interface for Pharo';
		action: [ self new start ]
]

{ #category : 'running' }
SparkleLauncher >> start [
	(self new: SpkLauncherPresenter) openWithSpec
]
