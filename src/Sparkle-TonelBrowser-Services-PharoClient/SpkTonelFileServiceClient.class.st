Class {
	#name : 'SpkTonelFileServiceClient',
	#superclass : 'SpkTonelFileService',
	#traits : 'SpkTPromise + SpkTModel + SpkTLinkedService + SpkTHierarchicalService',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait + SpkTLinkedService classTrait + SpkTHierarchicalService classTrait',
	#instVars : [
		'classDefinitionService',
		'classMethodServices',
		'instanceMethodServices'
	],
	#category : 'Sparkle-TonelBrowser-Services-PharoClient',
	#package : 'Sparkle-TonelBrowser-Services-PharoClient'
}

{ #category : 'accessing' }
SpkTonelFileServiceClient >> classMethodServices [

	^ classMethodServices ifNil: [ #(  ) ]
]

{ #category : 'as yet unclassified' }
SpkTonelFileServiceClient >> classPropertyServices [

	self flag: 'incomplete'.
	^ #(  )
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
		when: [ :result |
			classDefinitionService := result at: #classDefinition.
			classMethodServices := result at: #classMethods.
			instanceMethodServices := result at: #instanceMethods.
			self announceUpdate ]
		catch: self defaultCatchBlock
]
