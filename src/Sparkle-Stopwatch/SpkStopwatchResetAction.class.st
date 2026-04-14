Class {
	#name : 'SpkStopwatchResetAction',
	#superclass : 'SpkStopwatchAction',
	#instVars : [
		'undoneState'
	],
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

	self saveInitialState.
	target
		_reset;
		_updated
]

{ #category : 'public' }
SpkStopwatchResetAction >> redoAction [
	"We're about to update the elapsedTime"

	self restoreUndoneState.
	target _updated
]

{ #category : 'private' }
SpkStopwatchResetAction >> restoreUndoneState [

	target state: undoneState copy
]

{ #category : 'private' }
SpkStopwatchResetAction >> saveUndoneState [

	undoneState := target state copy
]

{ #category : 'public' }
SpkStopwatchResetAction >> undoAction [

	self
		saveUndoneState;
		restoreInitialState.
	target _updated
]
