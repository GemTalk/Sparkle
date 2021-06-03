Class {
	#name : 'SpkScaffoldingRowanService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'rowanService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingRowanService >> newRowanService [
	"probably shouldn't get here but just in case we do return a generic service which understands #postUpdate"

	^ RowanService new
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService [
	^ rowanService ifNil: [ rowanService := self newRowanService ]
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService: object [
	rowanService := object
]
