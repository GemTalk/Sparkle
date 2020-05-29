"
Initial entry point and coordinator for Sparkle
"
Class {
	#name : #SpkApplication,
	#superclass : #SpApplication,
	#category : #'Sparkle-Application'
}

{ #category : #activation }
SpkApplication class >> applicationName [
	^ 'GemStone IDE for Pharo'
]

{ #category : #'instance creation' }
SpkApplication class >> open [
	"SpkApplication open"

	self new start
]

{ #category : #running }
SpkApplication >> start [
	(self new: SpkLauncher) openWithSpec
]
