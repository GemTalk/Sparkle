Class {
	#name : 'SpkTaskspaceRegistryServiceClient',
	#superclass : 'SpkTaskspaceRegistryService',
	#category : 'Sparkle-Services-PharoClient'
}

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceClient >> taskspaceServiceNamed: aString [

	^ remoteSelf taskspaceServiceNamed: aString
]
