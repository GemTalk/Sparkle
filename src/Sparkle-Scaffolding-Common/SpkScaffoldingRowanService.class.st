Class {
	#name : 'SpkScaffoldingRowanService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'rowanService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'public-events' }
SpkScaffoldingRowanService >> postUpdate [

	super postUpdate. 
	self rowanService asRSR. 
	RowanCommandResult clearResults
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService [
	^ rowanService ifNil: [ rowanService := self new ]
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService: object [
	rowanService := object
]
