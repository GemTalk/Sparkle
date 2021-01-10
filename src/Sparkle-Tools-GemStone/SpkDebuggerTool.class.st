Class {
	#name : 'SpkDebuggerTool',
	#superclass : 'SpkTool',
	#instVars : [
		'process',
		'exception',
		'frames',
		'debugActionForContinue'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'other' }
SpkDebuggerTool >> frames [
	^ frames ifNil: [ frames := self initializeFramesFromProcess ]
]

{ #category : 'other' }
SpkDebuggerTool >> initializeFramesFromProcess [
	frames := Array new: process stackDepth.
]
