Class {
	#name : 'SparkleConnectionsLauncher',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleConnectionsLauncher class >> example [ 
	<example>
	self new start
]

{ #category : 'world menu' }
SparkleConnectionsLauncher class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Sparkle Connections Launcher')
		order: 0.9; 
		icon: nil;  
		parent: #'Tools';
		keyText: 'L'; "hot key doesn't work yet" 
		help: 'Sparkle is the GemStone connection creator for Pharo';
		action: [ self new start ]
]

{ #category : 'running' }
SparkleConnectionsLauncher >> start [
	(self new: SpkConnectionListPresenter) openWithSpec
]
