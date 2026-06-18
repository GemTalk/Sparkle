Class {
	#name : 'SpkTonelDirectoryListServiceClient',
	#superclass : 'SpkTonelDirectoryListService',
	#traits : 'SpkTPromise + SpkTModel + SpkTHierarchicalService',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait + SpkTHierarchicalService classTrait',
	#category : 'Sparkle-TonelBrowser-Services-PharoClient',
	#package : 'Sparkle-TonelBrowser-Services-PharoClient'
}

{ #category : 'actions' }
SpkTonelDirectoryListServiceClient >> createClassFile [

	| promise |
	promise := remoteSelf createClassFile.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListServiceClient >> dewServices [

	^ self sortedServicesWithExtension: 'dew'
]

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListServiceClient >> refreshFromServer [

	| promise |
	promise := remoteSelf refreshFromTool.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListServiceClient >> sortedServicesWithExtension: extension [

	| services |
	services := self children select: [ :each |
		            each hasExtension: extension ].
	^ services sorted: [ :a :b | a filename <= b filename ]
]

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListServiceClient >> stServices [

	^ self sortedServicesWithExtension: 'st'
]

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListServiceClient >> updateChildren: replacementChildren [

	self removeAllChildren.
	replacementChildren do: [ :child | self addChild: child ].
	self announceUpdate
]
