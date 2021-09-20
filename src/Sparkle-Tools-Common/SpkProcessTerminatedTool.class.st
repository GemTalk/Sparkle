Class {
	#name : 'SpkProcessTerminatedTool',
	#superclass : 'SpkTool',
	#instVars : [
		'process',
		'explorerTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'other' }
SpkProcessTerminatedTool class >> forProcess: aGsProcess [
	^ self new
		process: aGsProcess;
		yourself
]

{ #category : 'other' }
SpkProcessTerminatedTool class >> forProcess: aGsProcess
explorerTool: anExplorerTool [

	^ self new
		process: aGsProcess;
		explorerTool: anExplorerTool;
		yourself
]

{ #category : 'accessing' }
SpkProcessTerminatedTool >> explorerTool [

	^explorerTool
]

{ #category : 'accessing' }
SpkProcessTerminatedTool >> explorerTool: anExplorerTool [

	explorerTool := anExplorerTool
]

{ #category : 'accessing' }
SpkProcessTerminatedTool >> process [
	^process
]

{ #category : 'accessing' }
SpkProcessTerminatedTool >> process: object [
	process := object
]
