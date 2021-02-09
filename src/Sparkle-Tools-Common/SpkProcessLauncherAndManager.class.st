Class {
	#name : 'SpkProcessLauncherAndManager',
	#superclass : 'SpkProcessManager',
	#instVars : [
		'processPriority',
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

	process := [ 
	           result := aBlock value.
	           resultReady signal ] newProcess
]

{ #category : 'accessing' }
SpkProcessLauncherAndManager >> processPriority: aPriority [

	processPriority := aPriority
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> runProcess [

	process priority: processPriority.
	self resumeProcess
]

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> waitForResult [

	"Result may be a debugger"

	resultReady wait.
	^ result
]
