Class {
	#name : 'SpkDebuggerFrameService',
	#superclass : 'RsrService',
	#instVars : [
		'description',
		'source',
		'currentStartPosition',
		'currentEndPosition',
		'localVariables',
		'outerScope',
		'stackVariables'
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
SpkDebuggerFrameService >> localVariables: anObject [

	localVariables := anObject
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> outerScope [

	^ outerScope
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> outerScope: anObject [

	outerScope := anObject
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> source [

	^ source
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> source: anObject [

	source := anObject
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> stackVariables [

	^ stackVariables
]

{ #category : 'accessing' }
SpkDebuggerFrameService >> stackVariables: anObject [

	stackVariables := anObject
]
