Class {
	#name : 'SpkTonelClassDefinitionServiceServer',
	#superclass : 'SpkTonelClassDefinitionService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'initialization' }
SpkTonelClassDefinitionServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool when: SpkUpdateAnnouncement send: #refreshFromTool to: self
]

{ #category : 'as yet unclassified' }
SpkTonelClassDefinitionServiceServer >> refreshFromTool [

	| classDefinition |
	classDefinition := tool classDefinition.
	comment := classDefinition comment.
	name := classDefinition name.
	superclassName := classDefinition superclassName.
	optionalProperties := classDefinition optionalProperties
]
