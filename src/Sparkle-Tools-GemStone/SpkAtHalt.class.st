Class {
	#name : 'SpkAtHalt',
	#superclass : 'SpkAtException',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkAtHalt >> description [
	^ 'Stopped by Halt'
]

{ #category : 'dispatching' }
SpkAtHalt >> markTopGlueFor: aDebuggerTool [
	^ aDebuggerTool markTopGlueForHalt: exception
]
