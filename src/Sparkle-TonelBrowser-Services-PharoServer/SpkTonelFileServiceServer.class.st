Class {
	#name : 'SpkTonelFileServiceServer',
	#superclass : 'SpkTonelFileService',
	#traits : 'SpkTHierarchicalService + SpkTPromise',
	#classTraits : 'SpkTHierarchicalService classTrait + SpkTPromise classTrait',
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
	classDefinitionService := SpkTonelClassDefinitionServiceServer new.
	classMethodServices := Dictionary new.
	instanceMethodServices := Dictionary new
]

{ #category : 'initialization' }
SpkTonelFileServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	classDefinitionService initializeFromTool: tool.
	self refreshFromTool
]

{ #category : 'instance creation' }
SpkTonelFileServiceServer >> newMethodServiceFor: definition [

	^ SpkTonelMethodServiceServer new
		  registerWith: self connection;
		  refreshFromDefinition: definition;
		  yourself
]

{ #category : 'refreshing' }
SpkTonelFileServiceServer >> refreshClassMethodServices [

	classMethodServices := self
		                       refreshMethodDict: classMethodServices
		                       from: tool classMethods
]

{ #category : 'refreshing' }
SpkTonelFileServiceServer >> refreshFromTool [
	"Update and answer a Dictionary with three keys: #classDefinition, #classMethods, #instanceMethods"

	| result |
	filename := tool filename.

	self refreshClassMethodServices.

	self refreshInstanceMethodServices.
	result := Dictionary new: 3.
	result
		at: #classDefinition put: classDefinitionService;
		at: #classMethods put: classMethodServices;
		at: #instanceMethods put: instanceMethodServices.
	^ result
]

{ #category : 'refreshing' }
SpkTonelFileServiceServer >> refreshInstanceMethodServices [

	instanceMethodServices := self
		                          refreshMethodDict: instanceMethodServices
		                          from: tool instanceMethods
]

{ #category : 'private' }
SpkTonelFileServiceServer >> refreshMethodDict: servicesDict from: methodDefinitions [
	"servicesDict is a Dictionary, selector string -> methodServiceServer.
	methodDefinitions is a Dictionary, selector string ->  TnMethodDefinition.
	Answer a new servicesDict that matches methodDefinitions. If any methods have been added or removed,
	my sender will take care of letting the client know. The client will be notified of any changed
	methods by the existing methodServiceServer for that method."

	| newServicesDict |
	newServicesDict := Dictionary new: methodDefinitions size.
	methodDefinitions keysAndValuesDo: [ :selector :definition |
		servicesDict
			at: selector
			ifPresent: [ :service |
				newServicesDict at: selector put: service.
				service refreshFromDefinition: definition ]
			ifAbsent: [
				newServicesDict
					at: selector
					put: (self newMethodServiceFor: definition) ] ].
	^ newServicesDict
]

{ #category : 'public-registration' }
SpkTonelFileServiceServer >> registerWith: aConnection [

	super registerWith: aConnection.
	classDefinitionService registerWith: aConnection
]

{ #category : 'private' }
SpkTonelFileServiceServer >> sendClassMethodServices [

	| promise |
	self isMirrored ifFalse: [ ^ self ]. "Initializing, skip update."
	promise := remoteSelf updateClassMethodServices: classMethodServices.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'private' }
SpkTonelFileServiceServer >> sendFilename [

	| promise |
	self isMirrored ifFalse: [ ^ self ]. "Initializing, skip update."
	promise := remoteSelf updateFilename: filename.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'private' }
SpkTonelFileServiceServer >> sendInstanceMethodServices [

	| promise |
	self isMirrored ifFalse: [ ^ self ]. "Initializing, skip update."
	promise := remoteSelf updateInstanceMethodServices:
		           instanceMethodServices.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'accessing' }
SpkTonelFileServiceServer >> tool [

	^ tool
]
