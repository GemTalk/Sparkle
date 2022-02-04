Class {
	#name : 'SpkAtBreakpoint',
	#superclass : 'SpkAtException',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkAtBreakpoint >> description [
	^ 'It was a breakpoint'
]

{ #category : 'dispatching' }
SpkAtBreakpoint >> markTopGlueFor: aDebuggerTool [
	^ aDebuggerTool markTopGlueForBreakpoint: exception
]
