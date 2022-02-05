Class {
	#name : 'SpkTaskspaceLayoutServiceClient',
	#superclass : 'SpkTaskspaceLayoutService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'adding' }
SpkTaskspaceLayoutServiceClient >> addDefaultExplorer [

	| promise |
	promise := remoteSelf addDefaultExplorer.
	promise
		when: [ :xlService | self openNewExplorer: xlService]
		catch: self defaultCatchBlock
]

{ #category : 'adding' }
SpkTaskspaceLayoutServiceClient >> addProcessListExplorer [
	"Switch to automatic transaction mode"

	| promise |
	promise := remoteSelf newExplorerViewingAProcessList.
	promise
		when: [ :xlService | self openNewExplorer: xlService]
		catch: self defaultCatchBlock
]

{ #category : 'adding' }
SpkTaskspaceLayoutServiceClient >> openNewExplorer: anExplorerLayoutService [
	"Open the provided explorer at the request of the server"

	self updateServices.
	self announce: (SpkExplorerToOpenAnnouncement service: anExplorerLayoutService)
]
