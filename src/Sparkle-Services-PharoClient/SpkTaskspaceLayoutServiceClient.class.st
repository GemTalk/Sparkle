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
		when: [ :xlserv | 
			| ann |
			ann := SpkExplorerToOpenAnnouncement new
				       explorerLayoutService: xlserv;
				       yourself.
			self announce: ann ]
		catch: self defaultCatchBlock
]
