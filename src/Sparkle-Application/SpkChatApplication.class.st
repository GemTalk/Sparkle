"
Initial entry point and coordinator for Sparkle
"
Class {
	#name : 'SpkChatApplication',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SpkChatApplication class >> applicationName [
	^ 'GemStone IDE for Pharo'
]

{ #category : 'running' }
SpkChatApplication >> start [
	(self new: SpkLauncher) openWithSpec
]
