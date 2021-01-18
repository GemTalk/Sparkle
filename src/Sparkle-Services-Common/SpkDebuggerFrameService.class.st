Class {
	#name : 'SpkDebuggerFrameService',
	#superclass : 'RsrService',
	#instVars : [
		'description',
		'index'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerFrameService class >> templateClassName [

	^ #SpkDebuggerFrameService
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> description [

	^ description
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> description: anObject [

	description := anObject
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> index [
	^index
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> index: object [
	index := object
]
