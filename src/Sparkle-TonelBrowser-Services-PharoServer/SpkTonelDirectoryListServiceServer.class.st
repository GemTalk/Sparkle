Class {
	#name : 'SpkTonelDirectoryListServiceServer',
	#superclass : 'SpkTonelDirectoryListService',
	#traits : 'SpkTHierarchicalService + SpkTPromise',
	#classTraits : 'SpkTHierarchicalService classTrait + SpkTPromise classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'actions' }
SpkTonelDirectoryListServiceServer >> createClassFile [

	tool createClassFile
]

{ #category : 'initialization' }
SpkTonelDirectoryListServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool when: SpkUpdateAnnouncement send: #refreshFromTool to: self
]

{ #category : 'initialization' }
SpkTonelDirectoryListServiceServer >> refreshFileServices [
	"Create file services for each file tool, and transmit them to the other side.
	Note that this is not announced on the other side."

	| oldFileServices promise |
	oldFileServices := IdentityDictionary new: self children size.
	self children do: [ :fileService |
		oldFileServices at: fileService tool put: fileService ].
	self removeAllChildren.

	tool fileToolsDo: [ :fileTool |
		oldFileServices
			at: fileTool
			ifPresent: [ :fileService | self addChild: fileService ]
			ifAbsent: [
			self addChild: (SpkServiceFactory serviceForTool: fileTool) ] ].
	promise := remoteSelf updateChildren: self children.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'refreshing' }
SpkTonelDirectoryListServiceServer >> refreshFromTool [

	dirName := tool dirName.
	self refreshFileServices
]
