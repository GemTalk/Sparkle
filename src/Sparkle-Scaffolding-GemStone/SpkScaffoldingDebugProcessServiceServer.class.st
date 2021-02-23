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

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> compileMethodSource: sourceString at: aLevel [
	| homeFrame theMethod theBehavior theCategory |
	homeFrame := self homeFrameFor: aLevel.
	theMethod := homeFrame method _method.
	theBehavior := theMethod inClass.
	theCategory := theBehavior categoryOfSelector: theMethod selector.
	theBehavior
		compileMethod: sourceString
		dictionaries: GsCurrentSession currentSession symbolList
		category: theCategory
		environmentId: 0.
	rowanProcessService := rowanFrameServices := nil.	"clear these to force recalculation after stack has been trimmed"
	self trimStackToLevel: homeFrame frameIndex
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

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> homeFrameFor: frameIndex [
	| homeMethod |
	homeMethod := (self rowanFrameServices at: frameIndex) homeMethod.
	^ self rowanFrameServices
		detect: [ :frameService | frameService method _method == homeMethod ]
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
			| index |
			index := 1.
			rowanFrameServices := self rowanProcessService _frames
				collect: [ :frameService | 
					| frame |
					frame := SpkScaffoldingDebugFrameServiceServer new
						rowanFrameService: frameService;
						frameIndex: index;
						yourself.
					index := index + 1.
					frame ] ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceServer >> rowanProcessService [
	^ rowanProcessService
		ifNil: [ 
			suspendedProcess
				ifNotNil: [ :aSuspendedGsProcess | 
					rowanProcessService := RowanProcessService
						onSuspendedProcess: aSuspendedGsProcess ] ]
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

{ #category : 'debugging' }
SpkScaffoldingDebugProcessServiceServer >> trimStackToLevel: aLevel [
	| homeFrame |
	homeFrame := self homeFrameFor: aLevel.
	rowanProcessService := rowanFrameServices := nil.	"clear these to force recalculation after stack has been trimmed"
	self suspendedProcess _trimStackToLevel: homeFrame frameIndex
]
