Class {
	#name : 'SpkProcessListService',
	#superclass : 'RsrService',
	#instVars : [
		'updatedServices',
		'processes'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkProcessListService class >> templateClassName [

	^ #SpkProcessListService
]

{ #category : 'accessing' }
SpkProcessListService >> processes [

	^processes
]

{ #category : 'accessing' }
SpkProcessListService >> updatedServices [

	^ updatedServices
]

{ #category : 'accessing' }
SpkProcessListService >> updatedServices: aSet [

	updatedServices := aSet
]
