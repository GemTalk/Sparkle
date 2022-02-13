Class {
	#name : 'SpkTaskspaceRegistryServiceClient',
	#superclass : 'SpkTaskspaceRegistryService',
	#traits : 'SpkTPromise + SpkTModel',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'remote actions' }
SpkTaskspaceRegistryServiceClient >> newTaskspace [

	"Creates a new taskspace on the server,
	and announce it when it arrives."

	| promise |
	promise := remoteSelf newTaskspace.
	promise
		when: [ :tService | 
			self announce: (SpkNewTaskspaceAnnouncement new
					 taskspaceService: tService;
					 yourself) ]
		catch: self defaultCatchBlock
]

{ #category : 'remote actions' }
SpkTaskspaceRegistryServiceClient >> taskspaceServiceNamed: aString [

	^ remoteSelf taskspaceServiceNamed: aString
]
