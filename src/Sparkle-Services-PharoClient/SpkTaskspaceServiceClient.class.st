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

{ #category : 'actions' }
SpkTaskspaceServiceClient >> addDefaultExplorer [

	| promise |
	promise := remoteSelf addDefaultExplorer.
	promise
		when: [ :xService | self announceNewExplorer: xService ]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkTaskspaceServiceClient >> addProcessListExplorer [

	| promise |
	promise := remoteSelf addProcessListExplorer.
	promise
		when: [ :xService | self announceNewExplorer: xService ]
		catch: self defaultCatchBlock
]

{ #category : 'private' }
SpkTaskspaceServiceClient >> announceNewExplorer: anExplorerService [

	self updateServices.
	self announce: (SpkNewExplorerAnnouncement service: anExplorerService)
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

{ #category : 'transaction management' }
SpkTaskspaceServiceClient >> commitTransaction [
	"Commit the current transaction"

	| promise |
	promise := remoteSelf commitTransaction.
	promise
		when: [ :newService |
			self updateServices.
			self announce: (SpkTaskspaceResponseAnnouncement service: newService)]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkTaskspaceServiceClient >> newExplorerService: xService [

	"This message is sent from the server."

	self announceNewExplorer: xService.

	"Response is not used by the server, 
so send the cheapest object to send."
	^ nil
]

{ #category : 'transaction management' }
SpkTaskspaceServiceClient >> setAutomaticTransactionMode [
	"Switch to automatic transaction mode"

	| promise |
	promise := remoteSelf setAutomaticTransactionMode.
	promise
		when: [ :newService |
			self updateServices.
			self announce: (SpkTaskspaceResponseAnnouncement service: newService)]
		catch: self defaultCatchBlock
]

{ #category : 'transaction management' }
SpkTaskspaceServiceClient >> setManualTransactionMode [
	"Switch to manual transaction mode"

	| promise |
	promise := remoteSelf setManualTransactionMode.
	promise
		when: [ :newService |
			self updateServices.
			self announce: (SpkTaskspaceResponseAnnouncement service: newService)]
		catch: self defaultCatchBlock
]
