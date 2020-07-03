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

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
