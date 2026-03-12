Class {
	#name : 'SpkRuntimeErrorService',
	#superclass : 'RsrService',
	#instVars : [
		'stack',
		'title'
	],
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
}

{ #category : 'accessing' }
SpkRuntimeErrorService class >> templateClassName [

	^ #SpkRuntimeErrorService
]

{ #category : 'accessing' }
SpkRuntimeErrorService >> stack [

	^ stack
]

{ #category : 'accessing' }
SpkRuntimeErrorService >> title [

	^ title
]
