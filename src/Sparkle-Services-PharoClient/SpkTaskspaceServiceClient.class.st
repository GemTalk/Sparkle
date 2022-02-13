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

{ #category : 'private' }
SpkTaskspaceServiceClient >> announceNewExplorerAndPane: anExplorerAndPaneService [

	self updateServices.
	self announce: (SpkNewExplorerAndPaneAnnouncement
			 explorerService: anExplorerAndPaneService explorer
			 paneService: anExplorerAndPaneService pane)
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
SpkTaskspaceServiceClient >> newEvaluatorExplorer [

	| promise |
	promise := remoteSelf newEvaluatorExplorer.
	promise
		when: [ :xpService | self announceNewExplorerAndPane: xpService ]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkTaskspaceServiceClient >> newProcessListExplorer [

	| promise |
	promise := remoteSelf newProcessListExplorer.
	promise
		when: [ :xpService | self announceNewExplorerAndPane: xpService ]
		catch: self defaultCatchBlock
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
