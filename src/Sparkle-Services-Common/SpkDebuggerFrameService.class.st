Class {
	#name : 'SpkDebuggerFrameService',
	#superclass : 'SpkDebuggerFrameDescriptionService',
	#instVars : [
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
