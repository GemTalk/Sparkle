Class {
	#name : 'SparkleNewLauncher',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleNewLauncher class >> example [ 
	<example>
	self new start
]

{ #category : 'world menu' }
SparkleNewLauncher class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Sparkle New Launcher')
		order: 0.9; 
		icon: nil;  
		parent: #'Tools';
		keyText: 'L'; "hot key doesn't work yet" 
		help: 'Sparkle is the GemStone connection creator for Pharo';
		action: [ self new start ]
]

{ #category : 'running' }
SparkleNewLauncher >> start [
	(self new: SpkNewLauncherPresenter) openWithSpec
]
