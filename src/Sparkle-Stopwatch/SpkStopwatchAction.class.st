Class {
	#name : 'SpkStopwatchAction',
	#superclass : 'SpkAction',
	#instVars : [
		'isRunning',
		'startTime',
		'elapsedDuration'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkStopwatchAction >> elapsedDuration [

	^ elapsedDuration
]

{ #category : 'accessing' }
SpkStopwatchAction >> elapsedDuration: anObject [

	elapsedDuration := anObject
]

{ #category : 'accessing' }
SpkStopwatchAction >> isRunning [

	^ isRunning
]

{ #category : 'accessing' }
SpkStopwatchAction >> isRunning: anObject [

	isRunning := anObject
]

{ #category : 'private' }
SpkStopwatchAction >> rememberTargetState [

	isRunning := target isRunning.
	startTime := target startTime.
	elapsedDuration := target elapsedDuration
]

{ #category : 'private' }
SpkStopwatchAction >> restoreTargetState [

	target
		isRunning: isRunning;
		startTime: startTime;
		elapsedDuration: elapsedDuration;
		updateElapsedTimeString;
		announceUpdate
]

{ #category : 'accessing' }
SpkStopwatchAction >> startTime [

	^ startTime
]

{ #category : 'accessing' }
SpkStopwatchAction >> startTime: anObject [

	startTime := anObject
]
