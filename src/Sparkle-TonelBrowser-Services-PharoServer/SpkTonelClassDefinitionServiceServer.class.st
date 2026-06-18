Class {
	#name : 'SpkTonelClassDefinitionServiceServer',
	#superclass : 'SpkTonelClassDefinitionService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'accessing' }
SpkTonelClassDefinitionServiceServer >> comment [

	^ comment ifNil: [
		  comment := SpkTonelClassPropertyServiceServer forKey: 'Comment' ]
]

{ #category : 'initialization' }
SpkTonelClassDefinitionServiceServer >> initializeFromTool: aTool [

	tool := aTool
]

{ #category : 'accessing' }
SpkTonelClassDefinitionServiceServer >> name [

	^ name ifNil: [
		  name := SpkTonelClassPropertyServiceServer forKey: 'Name' ]
]

{ #category : 'accessing' }
SpkTonelClassDefinitionServiceServer >> optionalProperties [

	^ optionalProperties ifNil: [ optionalProperties := Dictionary new ]
]

{ #category : 'refreshing' }
SpkTonelClassDefinitionServiceServer >> refreshFromTool [

	| classDefinition |
	classDefinition := tool classDefinition.
	self comment value: classDefinition comment.
	self name value: classDefinition name.
	self superclassName value: classDefinition superclassName.
	self updateOptionalPropertiesFrom: classDefinition
]

{ #category : 'accessing' }
SpkTonelClassDefinitionServiceServer >> superclassName [

	^ superclassName ifNil: [
		  superclassName := SpkTonelClassPropertyServiceServer forKey: 'Superclass' ]
]

{ #category : 'refreshing' }
SpkTonelClassDefinitionServiceServer >> updateOptionalPropertiesFrom: aTnClassDefinition [

	self optionalProperties. "Make sure it's initialized."
	self flag: 'Fill in when optionalProperties are supported'
]
