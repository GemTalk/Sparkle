Class {
	#name : 'SpkProcessTerminatedService',
	#superclass : 'RsrService',
	#instVars : [
		'oop'
	],
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
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
