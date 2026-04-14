"
The important state of a stopwatch.

isRunning		 		<Boolean> 		True if time should be updated, false if the stopwatch is paused.
startTime				<DateAndTime> 	The virtual start time at which the stopwatch was started. Now - startTime is the displayed elapsed time.
elapsedDuration		<Duration>		Now - startTime as of the last update.
"
Class {
	#name : 'SpkStopwatchState',
	#superclass : 'Object',
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
SpkStopwatchState >> elapsedDuration [

	^ elapsedDuration
]

{ #category : 'accessing' }
SpkStopwatchState >> elapsedDuration: anObject [

	elapsedDuration := anObject
]

{ #category : 'initialization' }
SpkStopwatchState >> initialize [

	super initialize.
	isRunning := false.
	elapsedDuration := Duration zero.
	startTime := DateAndTime now
]

{ #category : 'accessing' }
SpkStopwatchState >> isRunning [

	^ isRunning
]

{ #category : 'accessing' }
SpkStopwatchState >> isRunning: anObject [

	isRunning := anObject
]

{ #category : 'accessing' }
SpkStopwatchState >> startTime [

	^ startTime
]

{ #category : 'accessing' }
SpkStopwatchState >> startTime: anObject [

	startTime := anObject
]
