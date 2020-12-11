Class {
	#name : 'SpkScaffoldingServiceService',
	#superclass : 'SpkScaffoldingService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'acccessing' }
SpkScaffoldingServiceService >> doit: aString [
	"the result of the expression should be shared class instance (see RsrReference class >> initializeReferenceMapping"

	^ aString evaluate
]
