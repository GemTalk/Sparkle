Class {
	#name : 'SpkProcessLauncher',
	#superclass : 'SpkObject',
	#instVars : [
		'processBody',
		'processPriority',
		'processName',
		'processBreakpointLevel',
		'processManager'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'actions' }
SpkProcessLauncher >> launch [

	| process |
	process := processBody newProcess.
	process
		name: processName;
		priority: processPriority;
		breakpointLevel: processBreakpointLevel.
	^ processManager
		process: process;
		processPriority: processPriority;
		resumeProcessAndWait
]

{ #category : 'accessing' }
SpkProcessLauncher >> processBody: aBlock [

	processBody := [ self processManager returnValue: aBlock value ]
]

{ #category : 'accessing' }
SpkProcessLauncher >> processBreakpointLevel: aBreakpointLevel [

	processBreakpointLevel := aBreakpointLevel
]

{ #category : 'accessing' }
SpkProcessLauncher >> processManager [

	^processManager
]

{ #category : 'accessing' }
SpkProcessLauncher >> processManager: aProcessManager [

	processManager := aProcessManager
]

{ #category : 'accessing' }
SpkProcessLauncher >> processName: object [
	processName := object
]

{ #category : 'accessing' }
SpkProcessLauncher >> processPriority: aPriority [

	processPriority := aPriority
]
