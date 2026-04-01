Class {
	#name : 'SpkStopwatchResetAction',
	#superclass : 'SpkStopwatchAction',
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkStopwatchResetAction >> name [
	^ 'Reset'
]

{ #category : 'public' }
SpkStopwatchResetAction >> performAction [

	self rememberTargetState.
	target _reset
]

{ #category : 'public' }
SpkStopwatchResetAction >> redoAction [
	"We're about to update the elapsedTime"

	self restoreTargetState
]

{ #category : 'public' }
SpkStopwatchResetAction >> undoAction [
	"We're about to update the elapsedTime. 
	Stop the update loop which might otherwise update once more."

	self restoreTargetState
]
