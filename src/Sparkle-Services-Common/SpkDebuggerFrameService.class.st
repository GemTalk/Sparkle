Class {
	#name : 'SpkDebuggerFrameService',
	#superclass : 'RsrService',
	#instVars : [
		'description',
		'source',
		'currentStartPosition',
		'currentEndPosition',
		'localVariables'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerFrameService class >> templateClassName [
	^ #'SpkDebuggerFrameService'
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> currentEndPosition [

	^ currentEndPosition
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> currentEndPosition: anObject [

	currentEndPosition := anObject
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> currentStartPosition [

	^ currentStartPosition
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> currentStartPosition: anObject [

	currentStartPosition := anObject
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
SpkDebuggerFrameService >> localVariables [

	^ localVariables
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> source [

	^ source
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> source: anObject [

	source := anObject
]
