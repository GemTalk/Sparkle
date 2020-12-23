Class {
	#name : 'SparkleLogin',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SparkleLogin class >> applicationName [ 
	^ 'Sparkle Connect'
]

{ #category : 'examples' }
SparkleLogin class >> example [ 
	<example>
	self new start
]

{ #category : 'world menu' }
SparkleLogin class >> menuCommandOn: aBuilder [ 
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
SparkleLogin >> start [
	(self new: SpkLoginPresenter) openWithSpec
]
