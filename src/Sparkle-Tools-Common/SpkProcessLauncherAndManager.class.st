Class {
	#name : 'SpkProcessLauncherAndManager',
	#superclass : 'SpkProcessManager',
	#instVars : [
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
