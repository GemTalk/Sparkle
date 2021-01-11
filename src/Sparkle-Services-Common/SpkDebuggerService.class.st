Class {
	#name : 'SpkDebuggerService',
	#superclass : 'RsrService',
	#instVars : [
		'exceptionDescription',
		'frames'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerService class >> templateClassName [

	^ #SpkDebuggerService
]

{ #category : 'other' }
SpkDebuggerService >> exceptionDescription [

	^ exceptionDescription
]
