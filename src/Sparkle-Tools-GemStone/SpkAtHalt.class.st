Class {
	#name : 'SpkAtHalt',
	#superclass : 'SpkAtException',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkAtHalt >> description [
	^ 'It was a Halt'
]

{ #category : 'dispatching' }
SpkAtHalt >> markTopGlueFor: aDebuggerTool [
	^ aDebuggerTool markTopGlueForHalt: exception
]
