Class {
	#name : 'SpkProcessLauncherAndManager',
	#superclass : 'SpkProcessManager',
	#instVars : [
		'explorerTool',
		'processPriority',
		'processName',
		'processBreakpointLevel',
		'result',
		'resultReady'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> debuggerMustInitiate [

	^ false
]

{ #category : 'accessing' }
SpkProcessLauncherAndManager >> explorerTool [

	^explorerTool
]

{ #category : 'accessing' }
SpkProcessLauncherAndManager >> explorerTool: anExplorerTool [

	explorerTool := anExplorerTool
]

{ #category : 'initialization' }
SpkProcessLauncherAndManager >> initialize [

	super initialize.
	resultReady := Semaphore new
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> proceedProcess [
	"Evaluation process waits for an answer and returns it"

	super proceedProcess.
	^ self waitForResult
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> processBody: aBlock [
	process := [ self returnValue: aBlock value ] newProcess
]

{ #category : 'accessing' }
SpkProcessLauncherAndManager >> processBreakpointLevel: anObject [

	processBreakpointLevel := anObject
]

{ #category : 'accessing' }
SpkProcessLauncherAndManager >> processName: object [
	processName := object
]

{ #category : 'accessing' }
SpkProcessLauncherAndManager >> processPriority: aPriority [

	processPriority := aPriority
]

{ #category : 'other' }
SpkProcessLauncherAndManager >> returnValue: anObject [
	result := anObject.
	resultReady signal
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> runProcess [

	process
		name: processName;
		priority: processPriority;
		breakpointLevel: processBreakpointLevel.
	self resumeProcess
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> waitForResult [

	"Result may be a debugger"

	resultReady wait.
	^ result
]
