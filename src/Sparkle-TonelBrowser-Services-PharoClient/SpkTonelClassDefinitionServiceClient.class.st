Class {
	#name : 'SpkTonelClassDefinitionServiceClient',
	#superclass : 'SpkTonelClassDefinitionService',
	#category : 'Sparkle-TonelBrowser-Services-PharoClient',
	#package : 'Sparkle-TonelBrowser-Services-PharoClient'
}

{ #category : 'as yet unclassified' }
SpkTonelClassDefinitionServiceClient >> classPropertyServices [

	| result |
	result := OrderedCollection new: optionalProperties size + 3.
	result
		add: name;
		add: superclassName;
		add: comment;
		addAll: optionalProperties values.
	^ result
]
