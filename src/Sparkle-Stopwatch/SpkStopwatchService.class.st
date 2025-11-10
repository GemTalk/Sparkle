Class {
	#name : 'SpkStopwatchService',
	#superclass : 'RsrService',
	#traits : 'SpkTPromise',
	#classTraits : 'SpkTPromise classTrait',
	#instVars : [
		'elapsedTimeString',
		'isRunning'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkStopwatchService class >> templateClassName [

	^ #SpkStopwatchService
]

{ #category : 'accessing' }
SpkStopwatchService >> elapsedTimeString [

	^ elapsedTimeString
]

{ #category : 'accessing' }
SpkStopwatchService >> elapsedTimeString: anObject [

	elapsedTimeString := anObject
]

{ #category : 'accessing' }
SpkStopwatchService >> isRunning [

	^ isRunning
]

{ #category : 'accessing' }
SpkStopwatchService >> isRunning: anObject [

	isRunning := anObject
]
