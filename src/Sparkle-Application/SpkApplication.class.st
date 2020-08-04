"
Abstract application for Sparkle applications
"
Class {
	#name : 'SpkApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'instance creation' }
SpkApplication class >> open [
	"SpkApplication open"

	^ self new
		start;
		yourself
]

{ #category : 'initialization' }
SpkApplication >> initialize [
	iconManager := SpkIconLibrary current
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
