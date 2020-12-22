Class {
	#name : 'SpkCompilationErrorService',
	#superclass : 'RsrService',
	#instVars : [
		'sourceCode',
		'errorMessage',
		'errorLocation'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkCompilationErrorService class >> templateClassName [

	^ #SpkCompilationErrorService
]

{ #category : 'accessing' }
SpkCompilationErrorService >> errorLocation [

	^ errorLocation
]

{ #category : 'accessing' }
SpkCompilationErrorService >> errorMessage [

	^ errorMessage
]

{ #category : 'accessing' }
SpkCompilationErrorService >> sourceCode [

	^ sourceCode
]
