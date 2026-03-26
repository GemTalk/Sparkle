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

	self rememberTargetState.
	target _run
]

{ #category : 'public' }
SpkStopwatchRunAction >> redoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	self restoreTargetState.
	target startUpdating
]

{ #category : 'public' }
SpkStopwatchRunAction >> undoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	target stopUpdating.
	self restoreTargetState
]
