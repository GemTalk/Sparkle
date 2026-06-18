Class {
	#name : 'SpkTonelClassPropertyService',
	#superclass : 'RsrService',
	#instVars : [
		'key',
		'value'
	],
	#category : 'Sparkle-TonelBrowser-Services-Common',
	#package : 'Sparkle-TonelBrowser-Services-Common'
}

{ #category : 'instance creation' }
SpkTonelClassPropertyService class >> forKey: aKey [

	^ self new
		  key: aKey;
		  yourself
]

{ #category : 'accessing' }
SpkTonelClassPropertyService class >> templateClassName [

	^ #SpkTonelClassPropertyService
]

{ #category : 'accessing' }
SpkTonelClassPropertyService >> key [

	^ key
]

{ #category : 'accessing' }
SpkTonelClassPropertyService >> key: anObject [

	key := anObject
]

{ #category : 'accessing' }
SpkTonelClassPropertyService >> value [

	^ value
]

{ #category : 'accessing' }
SpkTonelClassPropertyService >> value: anObject [

	value := anObject
]
