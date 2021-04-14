Class {
	#name : 'SpkProcessTerminatedService',
	#superclass : 'RsrService',
	#instVars : [
		'oop'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkProcessTerminatedService class >> templateClassName [

	^ #SpkProcessTerminatedService
]

{ #category : 'accessing' }
SpkProcessTerminatedService >> oop [
	^oop
]

{ #category : 'accessing' }
SpkProcessTerminatedService >> oop: object [
	oop := object
]
