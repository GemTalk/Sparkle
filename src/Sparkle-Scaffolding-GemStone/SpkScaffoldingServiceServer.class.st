Class {
	#name : 'SpkScaffoldingServiceServer',
	#superclass : 'SpkScaffoldingService',
	#instVars : [
		'doitException',
		'debugProcess'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> debugService [
	^ debugService
		ifNil: [ 
			debugService := SpkScaffoldingService serverClass new
				registerWith: self _connection;
				yourself ]
]

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doit_01: aString [
	^ aString evaluate
]

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doit_02: aString [
	doitResult := aString evaluate
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doit_03: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openInspectorOnClient: ex ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doit_04: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openDebuggerOnClient: ex ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doit_05: aString [
	"
		if I fork the monitor process how does that impact RSR?
			1. RSR blocks ... which is fine
			2. the mon process was blocked (or the pharo side was blocked), until the debugProcess connectioin was timed out
	"

	doitResult := [ aString evaluate ]
		on: Halt , Error
		do: [ :ex | 
			| mon |
			debugProcess := GsProcess _current.
			mon := [ self openDebuggerOnClient: ex ]
				forkAt: Processor userInterruptPriority.
			debugProcess suspend ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doit_06: aString [
	"
		Populate the doitStack iv with a process service and frame services representing the debugger meta data
	"

	doitResult := [ aString evaluate ]
		on: Halt , Error
		do: [ :ex | 
			| mon |
			debugProcess := GsProcess _current.
			mon := [ self openDebuggerOnClientWithProcessService: ex ]
				forkAt: Processor userInterruptPriority.
			debugProcess suspend ]
]

{ #category : 'accessing' }
SpkScaffoldingServiceServer >> doitException [
	^doitException
]

{ #category : 'accessing' }
SpkScaffoldingServiceServer >> doitException: object [
	doitException := object
]

{ #category : 'accessing' }
SpkScaffoldingServiceServer >> doitExceptionDescription [

	^ self doitException description
]

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doitResult [
	^ doitResult
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doitStack [
	^ doitStack ifNil: [ 'no stack available' ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openDebuggerOnClient [
	^ remoteSelf openDebuggerOnClient
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openDebuggerOnClient: ex [
	"at this point, just send a message to the client in the event of an error during doit execution"

	self debugService
		doitException: ex;
		doitStack: (GsProcess stackReportToLevel: 1000).
	^ self debugService openDebuggerOnClient wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openDebuggerOnClientWithProcessService: ex [
	"at this point, just send a message to the client in the event of an error during doit execution, populate the doitStack with a process service for the suspended debugProcess"

	self debugService
		doitException: ex;
		doitStack: (self processServiceFor: debugProcess).
	^ self debugService openDebuggerOnClient wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openInspectorOnClient [
	^ remoteSelf openInspectorOnClient
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openInspectorOnClient: ex [
	"at this point, just send a message to the client in the event of an error during doit execution"

	| svce |
	svce := self debugService
		doitException: ex;
		yourself.
	^ svce openInspectorOnClient wait
]

{ #category : 'process list' }
SpkScaffoldingServiceServer >> processList [
	^ processList
		ifNil: [ 
			| allP rpt |
			processList := Dictionary new.
			rpt := String new.
			allP := Processor allProcesses.
			allP
				do: [ :aProc | 
					| procName |
					procName := aProc name.
					procName isEmpty
						ifTrue: [ procName := aProc asOop asString ].
					processList at: procName put: aProc _reportString ].
			processList ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> processServiceFor: aSuspendedGsProcess [
	"return a process service with embedded frame services (wrapped Rowan services) for the given process"

	^ SpkScaffoldingDebugProcessServiceServer
		onSuspendedProcess: aSuspendedGsProcess
]
