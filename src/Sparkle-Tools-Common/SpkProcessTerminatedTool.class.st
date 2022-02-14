Class {
	#name : 'SpkProcessTerminatedTool',
	#superclass : 'SpkTool',
	#instVars : [
		'process'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'other' }
SpkProcessTerminatedTool class >> forProcess: aGsProcess [
	^ self new
		process: aGsProcess;
		yourself
]

{ #category : 'accessing' }
SpkProcessTerminatedTool >> process [
	^process
]

{ #category : 'accessing' }
SpkProcessTerminatedTool >> process: object [
	process := object
]
