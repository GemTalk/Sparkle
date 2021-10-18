Class {
	#name : 'SpkPresenterWithHeader',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'header'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'events' }
SpkPresenterWithHeader >> closeRequestedLocally [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkPresenterWithHeader >> initializeHeader [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkPresenterWithHeader >> initializePresenters [

	super initializePresenters.
	self initializeHeader
]
