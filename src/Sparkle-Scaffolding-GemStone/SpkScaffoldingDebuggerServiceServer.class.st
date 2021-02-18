Class {
	#name : 'SpkScaffoldingDebuggerServiceServer',
	#superclass : 'SpkScaffoldingDebuggerService',
	#instVars : [
		'resumptionValue'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> clearAllBreaks [
	"clear all breakpoints set in image"

	GsNMethod clearAllBreaks
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClient [
	| res |
	GsFile gciLogServer: self class name, '>>openDebuggerOnClient'.
	res := remoteSelf openDebuggerOnClient wait.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore signal.
	^ res
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClientForProcess: aSuspendedGsProcess exception: ex [
	| res |
	GsFile
		gciLogServer:
			self class name , '>>openDebuggerOnClientForProcess:exception: [0]'.
	self
		processService:
			((SpkScaffoldingDebugProcessServiceServer
				onSuspendedProcess: aSuspendedGsProcess)
				doitException: ex;
				debuggerService: self;
				yourself).
	res := remoteSelf openDebuggerOnClient wait.
	GsFile
		gciLogServer:
			self class name
				,
					'>>openDebuggerOnClientForProcess:exception: [1] -- after openDebuggerOnClient returned: '
				, res printString.
	GsFile
		gciLogServer:
			self class name
				,
					'>>openDebuggerOnClientForProcess:exception: [2] -- processService: ', processService printString.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore signal.
	^ res
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> resume [
	^ self processService resume
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> resumptionValue [
	^ resumptionValue
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> resumptionValue: anObject [
	"Note that if nil is used, then the exception will resume with object that is on the top of the stack"

	resumptionValue := anObject
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> setBreakpointForClass: className meta: isMeta selector: selector atStepPoint: stepPoint [
	"Set a breakpoint that will be signalled to the GCI.
		Returns true to indicate success.  Otherwise returns a string describing the error."

	| beh res |
	beh := Rowan globalNamed: className.
	isMeta
		ifTrue: [ beh := beh class ].
	res := beh
		_setMethodBreak: selector
		stepPoint: stepPoint
		env: 0
		breakpointLevel: 1.
	^ res
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> terminate [
	^ self processService terminate
]
