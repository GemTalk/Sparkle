Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> doit: aString [

	^(remoteSelf doit: aString) wait
]
