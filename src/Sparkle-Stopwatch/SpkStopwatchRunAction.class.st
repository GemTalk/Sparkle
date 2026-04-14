Class {
	#name : 'SpkStopwatchRunAction',
	#superclass : 'SpkStopwatchAction',
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkStopwatchRunAction >> name [
	^ 'Run'
]

{ #category : 'public' }
SpkStopwatchRunAction >> performAction [

	self saveInitialState.
	target
		_run;
		_updated
]

{ #category : 'public' }
SpkStopwatchRunAction >> redoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	self restoreInitialState.
	target
		_startRunning;
		_updated
]

{ #category : 'public' }
SpkStopwatchRunAction >> undoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	target stopUpdating.
	self restoreInitialState.
	target _updated
]
