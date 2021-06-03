Class {
	#name : 'SpkScaffoldingRowanService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'rowanService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService [
	^ rowanService ifNil: [ rowanService := self class new ]
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService: object [
	rowanService := object
]
