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
SpkScaffoldingDebugProcessServiceServer >> stepOverFromLevel_original: aLevel [
	self suspendedProcess stepOverFromLevel: aLevel.
	self suspendedProcess _activate.
	self suspendedProcess _continue.
	Processor yield.
	self
		rowanProcessService:
			(RowanProcessService onSuspendedProcess: self suspendedProcess).
	rowanFrameServices := nil.	"force refresh frames"
	self rowanFrameServices	"refresh frames"
]

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> stepOverFromLevel: aLevel [
	self suspendedProcess stepOverFromLevel: aLevel.
	self suspendedProcess _activate.
	[ :aProc | 
	| result status sched wasInCrit |
	"Continue execution. Return the result of execution if the receiver
     completes. Otherwise if a breakpoint is hit returns the receiver."
	aProc _checkIfDebuggable.
	sched := aProc _scheduler.
	wasInCrit := sched _enterCritical.
	status := aProc _statusString.
	status = 'ready'
		ifTrue: [ aProc _unscheduleProcess ].
	aProc _storeBit: 1 value: true.	"debuggingInProgress:=1"
	wasInCrit == 0
		ifTrue: [ sched _exitCritical ].

	result := aProc _primContinue: nil.

	wasInCrit := sched _enterCritical.
	status = 'ready'
		ifTrue: [ 
			result == aProc
				ifTrue: [ 
					aProc _isTerminated
						ifFalse: [ sched _scheduleProcess: aProc ] ] ].
	aProc _storeBit: 1 value: false.	"debuggingInProgress:=0"
	wasInCrit == 0
		ifTrue: [ sched _exitCritical ].
	result ] value: self suspendedProcess.	"in-line GsProcess >> _continue"

	Processor yield.
	self
		rowanProcessService:
			(RowanProcessService onSuspendedProcess: self suspendedProcess).
	rowanFrameServices := nil.	"force refresh frames"
	self rowanFrameServices	"refresh frames"
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
