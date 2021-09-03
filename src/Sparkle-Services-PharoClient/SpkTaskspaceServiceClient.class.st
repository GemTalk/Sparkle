Class {
	#name : 'SpkTaskspaceServiceClient',
	#superclass : 'SpkTaskspaceService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'transaction management' }
SpkTaskspaceServiceClient >> abortTransaction [
	"Abort the current transaction"

	| promise |
	promise := remoteSelf abortTransaction.
	promise
		when: [ :newService |
			self updateServices.
			self announce: (SpkTaskspaceResponseAnnouncement service: newService)]
		catch: self defaultCatchBlock
]

{ #category : 'transaction management' }
SpkTaskspaceServiceClient >> beginTransaction [
	"Begin a new transaction"

	| promise |
	promise := remoteSelf beginTransaction.
	promise
		when: [ :newService |
			self updateServices.
			self announce: (SpkTaskspaceResponseAnnouncement service: newService)]
		catch: self defaultCatchBlock
]
