Class {
	#name : 'SpkScaffoldingRowanService',
	#superclass : 'SpkScaffoldingAbstractService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'rsr workarounds' }
SpkScaffoldingRowanService >> prepareObjectForReplication: object [
	"RSR Doesn't support Associations"

	^ (object isKindOf: Association)
		ifTrue: [ Array with: object key with: object value ]
		ifFalse: [ object ]
]
