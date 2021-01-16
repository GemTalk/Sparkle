Class {
	#name : 'SpkScaffoldingDebugProcessServiceServer',
	#superclass : 'SpkScaffoldingDebugProcessService',
	#instVars : [
		'suspendedProcess',
		'rowanProcessService',
		'doitException',
		'debuggerService'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'instance creation' }
SpkScaffoldingDebugProcessServiceServer class >> onSuspendedProcess: aSuspendedGsProcess [
	^ super new
		initializeOnSuspendedProcess: aSuspendedGsProcess;
		yourself
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> debuggerService [
	^debuggerService
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> debuggerService: object [
	debuggerService := object
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> doitException [
	^doitException
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> doitException: anException [
	self messageText: anException messageText asString.
	doitException := anException
]

{ #category : 'initialization' }
SpkScaffoldingDebugProcessServiceServer >> initializeOnSuspendedProcess: aSuspendedGsProcess [
	"wil be using RowanProcessService>>servicePerform:withArguments: to send messages to the gsprocess"

	self suspendedProcess: aSuspendedGsProcess.
	self
		rowanProcessService:
			(RowanProcessService onSuspendedProcess: aSuspendedGsProcess).
	self
		suspendedProcessOop;
		rowanFrameServices	"prime the pump"
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> resume [
	self suspendedProcess resume
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> resumeWith: anObject [
	self debuggerService resumptionValue: anObject.
	self suspendedProcess resume
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> rowanFrameServices [
	^ rowanFrameServices
		ifNil: [ 
			rowanFrameServices := self rowanProcessService _frames
				collect: [ :frameService | SpkScaffoldingDebugFrameServiceServer new rowanFrameService: frameService ] ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> rowanProcessService [
	^ rowanProcessService
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> rowanProcessService: object [
	rowanProcessService := object
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> stepIntoFromLevel: aLevel [
	self suspendedProcess _activate.
	self suspendedProcess stepIntoFromLevel: aLevel.
	Processor yield
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> stepOverFromLevel: aLevel [
	self suspendedProcess _activate.
	self suspendedProcess stepOverFromLevel: aLevel.
	Processor yield
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> stepThroughFromLevel: aLevel [
	self suspendedProcess _activate.
	self suspendedProcess stepThroughFromLevel: aLevel.
	Processor yield
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> suspendedProcess [
	^suspendedProcess
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> suspendedProcess: object [
	suspendedProcess := object
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> suspendedProcessName [
	^ self suspendedProcess name isEmpty
		ifTrue: [ 'GsProcess [' , self suspendedProcessOop asString , ']' ]
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceServer >> suspendedProcessOop [
	^ suspendedProcessOop
		ifNil: [ suspendedProcessOop := self rowanProcessService oop ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> suspendedProcessReportString [
	| s |
	s := String new.
	s add: 'GsProcess (oop=' , self suspendedProcess asOop asString , ', '.
	s
		add: 'status=';
		add: self suspendedProcess _statusString;
		add: ', '.
	s
		add: 'priority=';
		add: self suspendedProcess priority printString;
		add: ')'.
	s lf.
	^ s
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> terminate [
	self suspendedProcess terminate
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> terminate9 [
	self suspendedProcess terminate9
]
