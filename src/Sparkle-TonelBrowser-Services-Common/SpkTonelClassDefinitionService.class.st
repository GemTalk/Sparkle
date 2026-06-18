Class {
	#name : 'SpkTonelClassDefinitionService',
	#superclass : 'RsrService',
	#instVars : [
		'comment',
		'name',
		'superclassName',
		'optionalProperties'
	],
	#category : 'Sparkle-TonelBrowser-Services-Common',
	#package : 'Sparkle-TonelBrowser-Services-Common'
}

{ #category : 'accessing' }
SpkTonelClassDefinitionService class >> templateClassName [

	^ #SpkTonelClassDefinitionService
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> comment [

	^ comment
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> comment: anObject [

	comment := anObject
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> name [

	^ name
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> optionalProperties [

	^ optionalProperties
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> optionalProperties: anObject [

	optionalProperties := anObject
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> superclassName [

	^ superclassName
]

{ #category : 'accessing' }
SpkTonelClassDefinitionService >> superclassName: anObject [

	superclassName := anObject
]
