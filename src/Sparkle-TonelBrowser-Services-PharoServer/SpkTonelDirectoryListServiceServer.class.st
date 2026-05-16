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

{ #category : 'initialization' }
SpkTonelDirectoryListServiceServer >> initializeFileServices [
	"Create file services for each file tool, and transmit them to the other side.
	Note that this is not announced on the other side."

	| promise |
	self removeAllChildren.

	tool fileToolsDo: [ :each |
		self addChild: (SpkServiceFactory serviceForTool: each) ].
	promise := remoteSelf addChildren: self children.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'initialization' }
SpkTonelDirectoryListServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'refreshing' }
SpkTonelDirectoryListServiceServer >> refreshFromTool [

	dirName := tool dirName
]
