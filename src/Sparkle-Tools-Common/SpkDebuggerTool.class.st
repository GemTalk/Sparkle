Class {
	#name : 'SpkDebuggerTool',
	#superclass : 'SpkTool',
	#instVars : [
		'process',
		'exception',
		'frames'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'other' }
SpkDebuggerTool >> initializeForException: anException inProcess: aGsProcess [

	self halt.
]
