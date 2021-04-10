Class {
	#name : 'SpkTaskspaceServiceClient',
	#superclass : 'SpkTaskspaceService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'adding' }
SpkTaskspaceServiceClient >> addDefaultExplorer [

	| promise |
	promise := remoteSelf addDefaultExplorer.
	promise when: [:explorerService |  self halt ] catch: self defaultCatchBlock
]
