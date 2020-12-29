Class {
	#name : 'SpkScaffoldingDebuggerServiceServer',
	#superclass : 'SpkScaffoldingDebuggerService',
	#instVars : [
		'resumptionValue'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClient [
	^ remoteSelf openDebuggerOnClient
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClientForProcess: aSuspendedGsProcess exception: ex [
	self
		processService:
			((SpkScaffoldingDebugProcessServiceServer
				onSuspendedProcess: aSuspendedGsProcess)
				doitException: ex;
				debuggerService: self
				yourself).
	^ self openDebuggerOnClient wait
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
