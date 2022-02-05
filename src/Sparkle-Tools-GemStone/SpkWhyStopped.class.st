Class {
	#name : 'SpkWhyStopped',
	#superclass : 'SpkObject',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkWhyStopped >> description [
	self subclassResponsibility
]

{ #category : 'dispatching' }
SpkWhyStopped >> markTopGlueFor: aDebuggerTool [
	self subclassResponsibility
]
