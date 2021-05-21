Class {
	#name : 'SpkScaffoldingRowanService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'rowanService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'rsr workarounds' }
SpkScaffoldingRowanService >> prepareObjectForReplication: object [
	"RSR Doesn't support Associations"

	^ (object isKindOf: Association)
		ifTrue: [ Array with: object key with: object value ]
		ifFalse: [ object ]
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService [
	^rowanService
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService: object [
	rowanService := object
]
