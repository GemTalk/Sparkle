Class {
	#name : 'SpkProcessLauncherAndManager',
	#superclass : 'SpkProcessManager',
	#instVars : [
		'processPriority',
		'processName',
		'processBreakpointLevel',
		'result',
		'resultReady'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkProcessLauncherAndManager >> debuggerMustInitiate [

	^ false
]

{ #category : 'initialization' }
SpkProcessLauncherAndManager >> initialize [
	super initialize.
	resultReady := Semaphore new
]

{ #category : 'accessing' }
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

{ #category : 'actions' }
SpkProcessLauncherAndManager >> resumeProcessAndWait [
	"Evaluation process waits for an answer and returns it"

	self resumeProcess.
	^ self waitForResult
]

{ #category : 'actions' }
SpkProcessLauncherAndManager >> returnValue: anObject [
	result := anObject.
	resultReady signal
]

{ #category : 'actions' }
SpkProcessLauncherAndManager >> runProcess [

	process
		name: processName;
		priority: processPriority;
		breakpointLevel: processBreakpointLevel.
	self resumeProcess
]

{ #category : 'actions' }
SpkProcessLauncherAndManager >> terminateProcess [
	"Evaluation process waits for termination to be complete and returns the tool.
	processBody must send me #returnValue: on completion of termination or this will hang."

	super terminateProcess.
	^ self waitForResult
]

{ #category : 'actions' }
SpkProcessLauncherAndManager >> waitForResult [
	"Result may be a debugger"

	resultReady wait.
	^ result
]
