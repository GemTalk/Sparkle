"
Initial entry point and coordinator for Sparkle
"
Class {
	#name : 'SpkChatApplication',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Experiments'
}

{ #category : 'activation' }
SpkChatApplication class >> applicationName [
	^ 'GemStone IDE for Pharo'
]

{ #category : 'examples' }
SpkChatApplication class >> example [
	<example>
	self open
]

{ #category : 'running' }
SpkChatApplication >> start [
	(self new: SpkLauncher) openWithSpec
]
