"
Abstract application for Sparkle applications
"
Class {
	#name : 'SpkApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'initialization' }
SpkApplication >> initialize [
	iconManager := SpkIconLibrary current
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
