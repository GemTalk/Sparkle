Class {
	#name : 'SpkStopwatchAction',
	#superclass : 'SpkAction',
	#instVars : [
		'initialState'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'private' }
SpkStopwatchAction >> restoreInitialState [

	target state: initialState copy
]

{ #category : 'private' }
SpkStopwatchAction >> saveInitialState [

	initialState := target state copy
]
