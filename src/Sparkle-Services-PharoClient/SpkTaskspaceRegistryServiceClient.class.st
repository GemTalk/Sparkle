Class {
	#name : 'SpkTaskspaceRegistryServiceClient',
	#superclass : 'SpkTaskspaceRegistryService',
	#traits : 'SpkTPromise + SpkTModel',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'remote actions' }
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

{ #category : 'remote actions' }
SpkTaskspaceRegistryServiceClient >> taskspaceServiceNamed: aString [

	^ remoteSelf taskspaceServiceNamed: aString
]
