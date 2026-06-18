Class {
	#name : 'SpkTonelFileServiceClient',
	#superclass : 'SpkTonelFileService',
	#traits : 'SpkTPromise + SpkTModel + SpkTLinkedService + SpkTHierarchicalService',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait + SpkTLinkedService classTrait + SpkTHierarchicalService classTrait',
	#category : 'Sparkle-TonelBrowser-Services-PharoClient',
	#package : 'Sparkle-TonelBrowser-Services-PharoClient'
}

{ #category : 'accessing' }
SpkTonelFileServiceClient >> classMethodServices [

	^ classMethodServices ifNil: [ #(  ) ]
]

{ #category : 'as yet unclassified' }
SpkTonelFileServiceClient >> classPropertyServices [

	^ classDefinitionService classPropertyServices
]

{ #category : 'accessing' }
SpkTonelFileServiceClient >> displayName [

	self flag:
		'Probably really want to display just the class name, not the whole filename'.
	^ filename
]

{ #category : 'testing' }
SpkTonelFileServiceClient >> hasExtension: extensionString [

	^ filename endsWith: '.' , extensionString
]

{ #category : 'accessing' }
SpkTonelFileServiceClient >> instanceMethodServices [

	^ instanceMethodServices ifNil: [ #(  ) ]
]

{ #category : 'as yet unclassified' }
SpkTonelFileServiceClient >> refreshFromServer [

	| promise |
	promise := remoteSelf refreshFromTool.
	promise
		when: [ :result | self announceUpdate ]
		catch: self defaultCatchBlock
]
