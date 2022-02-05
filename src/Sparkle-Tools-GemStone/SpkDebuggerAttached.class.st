Class {
	#name : 'SpkDebuggerAttached',
	#superclass : 'SpkWhyStopped',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'acessing' }
SpkDebuggerAttached >> description [

	^ 'Attached process'
]

{ #category : 'dispatching' }
SpkDebuggerAttached >> markTopGlueFor: aDebuggerTool [
	"We don't know what state an attached process is in, so no trimming."
]
