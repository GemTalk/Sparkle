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

	self rememberTargetState.
	target _pause
]

{ #category : 'public' }
SpkStopwatchPauseAction >> redoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	target stopUpdating.
	self restoreTargetState
]

{ #category : 'public' }
SpkStopwatchPauseAction >> undoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	self restoreTargetState.
	target startUpdating
]
