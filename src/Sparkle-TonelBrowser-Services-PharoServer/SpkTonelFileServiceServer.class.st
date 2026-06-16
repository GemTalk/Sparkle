Class {
	#name : 'SpkTonelFileServiceServer',
	#superclass : 'SpkTonelFileService',
	#traits : 'SpkTPromise',
	#classTraits : 'SpkTPromise classTrait',
	#instVars : [
		'tool',
		'classDefinitionService',
		'classMethodServices',
		'instanceMethodServices'
	],
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'initialization' }
SpkTonelFileServiceServer >> initialize [

	super initialize.
	"Method services are indexed by selector"
	classMethodServices := Dictionary new.
	instanceMethodServices := Dictionary new
]

{ #category : 'initialization' }
SpkTonelFileServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'refreshing' }
SpkTonelFileServiceServer >> refreshClassMethodServices [

	self
		refreshMethodDict: classMethodServices
		from: tool classMethods
]

{ #category : 'refreshing' }
SpkTonelFileServiceServer >> refreshFromTool [

	| oldValue |
	oldValue := filename.
	filename := tool filename.
	filename ~= oldValue ifTrue: [ self sendFilename ].

	"If definition changes, it sends its own update."
	classDefinitionService refreshFromTool.

	"Check for added/removed methods. 
	Updates to existing methods are sent in refresh of the services."
	oldValue := classMethodServices.
	self refreshClassMethodServices.
	classMethodServices ~= oldValue ifTrue: [
		self sendClassMethodServices ].

	oldValue := instanceMethodServices.
	self refreshInstanceMethodServices.
	instanceMethodServices ~= oldValue ifTrue: [
		self sendInstanceMethodServices ]
]

{ #category : 'refreshing' }
SpkTonelFileServiceServer >> refreshInstanceMethodServices [

	self
		refreshMethodDict: instanceMethodServices
		from: tool instanceMethods
]

{ #category : 'private' }
SpkTonelFileServiceServer >> refreshMethodDict: servicesDict from: methodDefinitions [
	"servicesDict is an Dictionary, selector string -> methodServiceServer.
	methodDefinitions is a Dictionary, selector string ->  TnMethodDefinition."

	self halt
]

{ #category : 'private' }
SpkTonelFileServiceServer >> sendClassMethodServices [

	| promise |
	promise := remoteSelf updateClassMethodServices: classMethodServices.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'private' }
SpkTonelFileServiceServer >> sendFilename [

	| promise |
	promise := remoteSelf updateFilename: filename.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'private' }
SpkTonelFileServiceServer >> sendInstanceMethodServices [

	| promise |
	promise := remoteSelf updateInstanceMethodServices:
		           instanceMethodServices.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'accessing' }
SpkTonelFileServiceServer >> tool [

	^ tool
]
