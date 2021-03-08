Class {
	#name : 'SpkProcessLauncherAndManager',
	#superclass : 'SpkProcessManager',
	#instVars : [
		'explorerTool',
		'processPriority',
		'processName',
		'result',
		'resultReady'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'as yet unclassified' }
SpkProcessLauncherAndManager >> continueProcess [
	"Evaluation process waits for an answer and returns it"

	super continueProcess.
	^ self waitForResult
]

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

{ #category : 'initialization' }
SpkProcessLauncherAndManager >> initializeDebuggerTool [

	super initializeDebuggerTool.
	debuggerTool explorerTool: explorerTool
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
