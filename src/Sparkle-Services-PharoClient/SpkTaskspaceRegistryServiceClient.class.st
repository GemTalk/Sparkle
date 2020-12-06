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
	self flag: 'This method is obsolete'.
	promise := remoteSelf defaultTaskspaceService.
	promise
		when: [ :ts | 
			self announce: (SpkTaskspaceAnnouncement new
					 taskspaceService: ts;
					 yourself) ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceClient >> newDefaultTaskspaceLayout [

	"Create a default taskspace and layout. 
	The new TaskspaceLayout arrives via announcement."

	| promise |
	promise := remoteSelf newDefaultTaskspaceLayout.
	promise
		when: [ :tls | 
			self announce: (SpkTaskspaceLayoutAnnouncement new
					 taskspaceLayoutService: tls;
					 yourself) ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceClient >> taskspaceServiceNamed: aString [

	^ remoteSelf taskspaceServiceNamed: aString
]
