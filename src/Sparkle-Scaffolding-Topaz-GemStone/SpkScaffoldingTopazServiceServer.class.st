Class {
	#name : 'SpkScaffoldingTopazServiceServer',
	#superclass : 'SpkScaffoldingTopazService',
	#instVars : [
		'doitException',
		'debugProcess'
	],
	#category : 'Sparkle-Scaffolding-Topaz-GemStone'
}

{ #category : 'service loop' }
SpkScaffoldingTopazServiceServer class >> port [
	^ 7653
]

{ #category : 'service loop' }
SpkScaffoldingTopazServiceServer class >> scaffoldingConnectionServiceLoop: listenForDebugConnection [
	"start listening on the scaffolding host/port and wait for a connection, 
		when connection is made wait for connection to close and start 
		another waiting for a new connection.

	if <listenForDebugConnection> is true, start listening service, to allow 
		remote debugging.
	"

	"currently expected to be run in a topaz session, when using 
		<listenForDebugConnection> use
			IFERR 2 TOPAZWAITFORDEBUG
	"

	| host port acceptor connection |
	listenForDebugConnection
		ifTrue: [ System listenForDebugConnection ].
	host := '127.0.0.1'.
	port := self port.
	acceptor := RsrAcceptConnection host: host port: port.
	GsProcess _current name: 'Scaffolding service loop'.
	[ 
	GsFile gciLogServer: 'waiting for connection'.
	connection := acceptor waitForConnection.
	System abort.	"update view"
	true ]
		whileTrue: [ 
			GsFile gciLogServer: 'got a connection'.
			connection waitUntilClose ]
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> debugService [
	^ debugService
		ifNil: [ 
			debugService := self class new
				registerWith: self _connection;
				yourself ]
]

{ #category : 'doits' }
SpkScaffoldingTopazServiceServer >> doit_01: aString [
	^ aString evaluate
]

{ #category : 'doits' }
SpkScaffoldingTopazServiceServer >> doit_02: aString [
	doitResult := aString evaluate
]

{ #category : 'accessing' }
SpkScaffoldingTopazServiceServer >> doitException [
	^doitException
]

{ #category : 'accessing' }
SpkScaffoldingTopazServiceServer >> doitException: object [
	doitException := object
]

{ #category : 'accessing' }
SpkScaffoldingTopazServiceServer >> doitExceptionDescription [

	^ self doitException description
]

{ #category : 'doits' }
SpkScaffoldingTopazServiceServer >> doitResult [
	^ doitResult
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> doitStack [
	^ doitStack ifNil: [ 'no stack available' ]
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> gsDebugger_01: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openInspectorOnClient: ex ]
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> gsDebugger_02: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openDebuggerOnClient: ex ]
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> gsDebugger_03: aString [
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
SpkScaffoldingTopazServiceServer >> gsDebugger_04: aString [
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
			debugProcess suspend.
			"open question: once I suspend the process, how do I arrange for the doitResult to get set the final result of the process?"
			nil ]
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> openDebuggerOnClient [
	^ remoteSelf openDebuggerOnClient
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> openDebuggerOnClient: ex [
	"at this point, just send a message to the client in the event of an error during doit execution"

	self debugService
		doitException: ex;
		doitStack: (GsProcess stackReportToLevel: 1000).
	^ self debugService openDebuggerOnClient wait
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> openDebuggerOnClientWithProcessService: ex [
	"at this point, just send a message to the client in the event of an error during doit execution, populate the doitStack with a process service for the suspended debugProcess"

	self debugService
		doitException: ex;
		doitStack: (self processServiceFor: debugProcess).
	^ self debugService openDebuggerOnClient wait
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> openInspectorOnClient [
	^ remoteSelf openInspectorOnClient
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceServer >> openInspectorOnClient: ex [
	"at this point, just send a message to the client in the event of an error during doit execution"

	| svce |
	svce := self debugService
		doitException: ex;
		yourself.
	^ svce openInspectorOnClient wait
]

{ #category : 'process list' }
SpkScaffoldingTopazServiceServer >> processList [
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
SpkScaffoldingTopazServiceServer >> processServiceFor: aSuspendedGsProcess [
	"return a process service with embedded frame services (wrapped Rowan services) for the given process"

	^ SpkScaffoldingDebugProcessServiceServer
		onSuspendedProcess: aSuspendedGsProcess
]
