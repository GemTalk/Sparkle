Class {
	#name : 'SpkTonelDirectoryListServiceClient',
	#superclass : 'SpkTonelDirectoryListService',
	#traits : 'SpkTPromise + SpkTModel + SpkTHierarchicalService',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait + SpkTHierarchicalService classTrait',
	#category : 'Sparkle-TonelBrowser-Services-PharoClient',
	#package : 'Sparkle-TonelBrowser-Services-PharoClient'
}

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListServiceClient >> dewServices [

	^ self children select: [ :each | each hasExtension: 'dew' ]
]

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListServiceClient >> stServices [

	^ self children select: [ :each | each hasExtension: 'st' ]
]
