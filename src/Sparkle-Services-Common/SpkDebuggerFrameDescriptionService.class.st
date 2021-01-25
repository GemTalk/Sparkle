Class {
	#name : 'SpkDebuggerFrameDescriptionService',
	#superclass : 'SpkLinkableSubService',
	#instVars : [
		'description',
		'index'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerFrameDescriptionService class >> templateClassName [

	^ #SpkDebuggerFrameDescriptionService
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionService >> description [

	^ description
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionService >> description: anObject [

	description := anObject
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionService >> index [
	^index
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionService >> index: object [
	index := object
]
