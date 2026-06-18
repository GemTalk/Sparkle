Class {
	#name : 'SpkTonelMethodServiceServer',
	#superclass : 'SpkTonelMethodService',
	#traits : 'SpkTPromise',
	#classTraits : 'SpkTPromise classTrait',
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'as yet unclassified' }
SpkTonelMethodServiceServer >> refreshFromDefinition: definition [

	selector := definition selector.
	source := definition source
]
