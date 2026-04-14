Class {
	#name : 'SpkStopwatchPauseAction',
	#superclass : 'SpkStopwatchAction',
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkStopwatchPauseAction >> name [
	^ 'Pause'
]

{ #category : 'public' }
SpkStopwatchPauseAction >> performAction [

	self saveInitialState.
	target
		_pause;
		_updated
]

{ #category : 'public' }
SpkStopwatchPauseAction >> redoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	self restoreInitialState.
	target
		_pause;
		_updated
]

{ #category : 'public' }
SpkStopwatchPauseAction >> undoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	self restoreInitialState.
	target
		_startRunning;
		_updated
]
