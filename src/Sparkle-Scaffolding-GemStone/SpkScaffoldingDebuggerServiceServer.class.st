Class {
	#name : 'SpkScaffoldingDebuggerServiceServer',
	#superclass : 'SpkScaffoldingDebuggerService',
	#instVars : [
		'doitException'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingDebuggerServiceServer >> doitException [
	^doitException
]

{ #category : 'accessing' }
SpkScaffoldingDebuggerServiceServer >> doitException: object [
	doitException := object
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClient [
	^ remoteSelf openDebuggerOnClient
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClientForProcess: aSuspendedGsProcess exception: ex [
	self
		processService:
				(SpkScaffoldingDebugProcessServiceServer onSuspendedProcess: aSuspendedGsProcess);
		doitException: ex;
		yourself.
	^ self openDebuggerOnClient wait
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> resumptionValue [
	"for now"

	^ nil
]
