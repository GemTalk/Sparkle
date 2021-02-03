Class {
	#name : 'SpkDebuggerService',
	#superclass : 'RsrService',
	#instVars : [
		'processName',
		'processIdentifier',
		'processPriority',
		'exceptionDescription',
		'frames'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerService class >> templateClassName [

	^ #SpkDebuggerService
]

{ #category : 'accessing' }
SpkDebuggerService >> exceptionDescription [

	^ exceptionDescription
]

{ #category : 'accessing' }
SpkDebuggerService >> frames [

	^ frames
]

{ #category : 'accessing' }
SpkDebuggerService >> processIdentifier [
	^ processIdentifier
]

{ #category : 'accessing' }
SpkDebuggerService >> processName [
	^ processName
]

{ #category : 'accessing' }
SpkDebuggerService >> processPriority [
	^ processPriority
]
