Class {
	#name : 'SpkTaskspaceRegistryServiceClient',
	#superclass : 'SpkTaskspaceRegistryService',
	#traits : 'SpkTPromise + SpkTModel',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceClient >> defaultTaskspaceService [

	| promise |
	promise := remoteSelf defaultTaskspaceService.
	promise
		when: [ :ts | 
			self announce: (SpkTaskspaceAnnouncement new
					 taskspaceService: ts;
					 yourself) ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceClient >> taskspaceServiceNamed: aString [

	^ remoteSelf taskspaceServiceNamed: aString
]
