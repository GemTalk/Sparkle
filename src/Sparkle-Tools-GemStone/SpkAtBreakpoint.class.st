Class {
	#name : 'SpkAtBreakpoint',
	#superclass : 'SpkAtException',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkAtBreakpoint >> description [
	^ 'Stopped by Breakpoint'
]

{ #category : 'dispatching' }
SpkAtBreakpoint >> markTopGlueFor: aDebuggerTool [
	^ aDebuggerTool markTopGlueForBreakpoint: exception
]
