Class {
	#name : 'SpkTonelMethodServiceServer',
	#superclass : 'SpkTonelMethodService',
	#traits : 'SpkTPromise',
	#classTraits : 'SpkTPromise classTrait',
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'refreshing' }
SpkTonelMethodServiceServer >> refreshFromDefinition: definition [

	selector := definition selector.
	source := definition source
]
