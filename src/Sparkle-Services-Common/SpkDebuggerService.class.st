Class {
	#name : 'SpkDebuggerService',
	#superclass : 'RsrService',
	#instVars : [
		'processName',
		'processIdentifier',
		'processPriority',
		'exceptionDescription',
		'frames',
		'updatedServices',
		'replacementService'
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

{ #category : 'initialize' }
SpkDebuggerService >> initialize [

	super initialize.
	updatedServices := Set new.
	frames := #().
	replacementService := self
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
