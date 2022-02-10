Class {
	#name : 'SpkTaskspaceRegistryServiceClient',
	#superclass : 'SpkTaskspaceRegistryService',
	#traits : 'SpkTPromise + SpkTModel',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'remote actions' }
SpkTaskspaceRegistryServiceClient >> newDefaultTaskspace [

	"Create a default taskspace. 
	The new TaskspaceService arrives via announcement."

	| promise |
	promise := remoteSelf newDefaultTaskspace.
	promise
		when: [ :ts | 
			self announce: (SpkNewTaskspaceAnnouncement new
					 taskspaceService: ts;
					 yourself) ]
		catch: self defaultCatchBlock
]

{ #category : 'remote actions' }
SpkTaskspaceRegistryServiceClient >> taskspaceServiceNamed: aString [

	^ remoteSelf taskspaceServiceNamed: aString
]
