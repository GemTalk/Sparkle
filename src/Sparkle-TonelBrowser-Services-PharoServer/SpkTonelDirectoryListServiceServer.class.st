Class {
	#name : 'SpkTonelDirectoryListServiceServer',
	#superclass : 'SpkTonelDirectoryListService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'initialization' }
SpkTonelDirectoryListServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'refreshing' }
SpkTonelDirectoryListServiceServer >> refreshFromTool [

	dirName := tool dirName.
	stFilenames := tool stFilenames.
	dewFilenames := tool dewFilenames
]
