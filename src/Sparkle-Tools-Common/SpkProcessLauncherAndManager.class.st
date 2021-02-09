Class {
	#name : 'SpkProcessLauncherAndManager',
	#superclass : 'SpkProcessManager',
	#instVars : [
		'processPriority',
		'processName',
		'result',
		'resultReady'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> debuggerMustInitiate [

	^ false
]

{ #category : 'initialization' }
SpkProcessLauncherAndManager >> initialize [

	super initialize.
	resultReady := Semaphore new
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> processBody: aBlock [
	process := [ self returnValue: aBlock value ] newProcess
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
		priority: processPriority.
	self resumeProcess
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> waitForResult [

	"Result may be a debugger"

	resultReady wait.
	^ result
]
