Class {
	#name : 'SpkScaffoldingServiceServer',
	#superclass : 'SpkScaffoldingService',
	#instVars : [
		'doitException',
		'debugProcess'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'service loop' }
SpkScaffoldingServiceServer class >> port [
	^ 7652
]

{ #category : 'service loop' }
SpkScaffoldingServiceServer class >> scaffoldingConnectionServiceLoop: listenForDebugConnection [
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
	host := '0.0.0.0'.
	port := self port.
	acceptor := RsrAcceptConnection host: host port: port.
	GsProcess _current name: 'SpkScaffolding service loop'.
	[ 
	GsFile gciLogServer: 'waiting for connection'.
	connection := acceptor waitForConnection.
	System abort.	"update view"
	acceptor initialize.	"prepare to wait for next connection"
	true ]
		whileTrue: [ 
			GsFile gciLogServer: 'got a connection'.
			connection waitUntilClose ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> clearAllBreaks [
	"clear all breakpoints set in image"

	GsNMethod clearAllBreaks
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> debugProcessOop: processOop usingDebugger: debuggerService [
	"copied from gsDebugger_07:usingDebugger:procName"

	"
		Used for debugging forked thread, since we are opening the debugger without using SpkScaffoldingAbstractService >> debug:raisedDuring:answerUsing:, 
			using our own debugActionBlock and SpkScaffoldingAbstractService >> debug: instead ...
	"

	| theDebugProcess |
	theDebugProcess := Object _objectForOop: processOop.
	theDebugProcess suspend.
	[ 
	| res |
	GsProcess _current
		breakpointLevel: 0;
		debugActionBlock: nil.	"any errors at this point should go straight to GCI"
	theDebugProcess suspend.
	res := debuggerService
		openDebuggerOnClientForProcess: theDebugProcess
		exception: Error new.	"needed?"
	res ] forkAt: Processor userInterruptPriority
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> debugService [
	^ debugService
		ifNil: [ 
			debugService := self class new
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

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doit: aString contextOop: oop [
	doitResult := aString
		evaluateInContext: (Object _objectForOop: oop)
		symbolList: GsSession currentSession symbolList
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doIt: aString usingDebugger: debuggerService contextOop: contextOop [
	self
		gsDebugger_07: aString
		usingDebugger: debuggerService
		procName: 'SpkScaffoldingServiceServer>>printIt:usingDebugger:contextOop:'
		contextOop: contextOop.
	doitResult := nil	"don't return result"
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

{ #category : 'process list' }
SpkScaffoldingServiceServer >> gcSuspendedProcesses [
	| scheduler |
	scheduler := ProcessorScheduler scheduler.
	^ (scheduler suspendedProcesses
		collect: [ :proc | 
			| ps |
			ps := self processReportString: proc.
			proc terminate.
			ps ]) asArray
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_01: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openInspectorOnClient: ex ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_02: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openDebuggerOnClient: ex ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_03: aString [
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
SpkScaffoldingServiceServer >> gsDebugger_04: aString [
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
			ex resume	"as suggested by Allen" ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_05: aString [
	"
		no exception handlers ... deliver a remote error
	"
	UserGlobals
		at: #'ScaffoldingServiceServerDebugHandlerType'
		put: #'remoteClientError'.
	doitResult := aString evaluate
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_06: aString [
	"
		no exception handlers ... deliver a remote error
	"

	GsProcess _current
		priority: Processor userSchedulingPriority;
		breakpointLevel: 1.	"this belongs in RSR,but until the RsrProcessModel is updated we'll set it here"
	UserGlobals
		at: #'ScaffoldingServiceServerDebugHandlerType'
		put: #'remoteDebugger'.
	doitResult := aString evaluate
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_07: aString [
	"
		Used for debugging forked thread, since we are opening the debugger without using SpkScaffoldingAbstractService >> debug:raisedDuring:answerUsing:, 
			using our own debugActionBlock and SpkScaffoldingAbstractService >> debug: instead ...
	"

	| cur debugActionBlock |
	cur := GsProcess _current.
	debugActionBlock := cur debugActionBlock.	"in case it's needed"
	cur
		debugActionBlock: [ :ex | 
					| mon theDebugProcess debuggerService |
					theDebugProcess := GsProcess _current.
					mon := [ 
					GsProcess _current debugActionBlock: nil.	"any errors at this point should go straight to GCI"
					debuggerService := SpkScaffoldingDebuggerServiceServer new
						registerWith: self connection;
						openDebuggerOnClientForProcess: theDebugProcess exception: ex;
						yourself ] forkAt: Processor userInterruptPriority.
					theDebugProcess suspend.
					debuggerService resumptionValue	"necessary" ];
		priority: Processor userSchedulingPriority;
		breakpointLevel: 1.	"this belongs in RSR,but until the RsrProcessModel is updated we'll set it here"
	doitResult := aString evaluate
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_07: aString usingDebugger: debuggerService [
	^ self
		gsDebugger_07: aString
		usingDebugger: debuggerService
		procName: 'SpkScaffoldingServiceServer>>gsDebugger_07:usingDebugger:'
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_07: aString usingDebugger: debuggerService contextOop: contextOop [
	^ self
		gsDebugger_07: aString
		usingDebugger: debuggerService
		procName: 'SpkScaffoldingServiceServer>>gsDebugger_07:usingDebugger:contextOop:'
		contextOop: contextOop
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_07: aString usingDebugger: debuggerService procName: procName [
	self
		gsDebugger_07: aString
		usingDebugger: debuggerService
		procName: procName
		contextOop: nil asOop
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> gsDebugger_07: aString usingDebugger: debuggerService procName: procName contextOop: contextOop [
	"
		Used for debugging forked thread, since we are opening the debugger without using SpkScaffoldingAbstractService >> debug:raisedDuring:answerUsing:, 
			using our own debugActionBlock and SpkScaffoldingAbstractService >> debug: instead ...
	"

	| cur debugActionBlock |
	cur := GsProcess _current.
	cur name: procName.
	debugActionBlock := cur debugActionBlock.	"in case it's needed"
	cur
		priority: Processor userSchedulingPriority;
		breakpointLevel: 1;
		debugActionBlock: [ :ex | 
					| mon theDebugProcess |
					theDebugProcess := GsProcess _current.
					mon := [ 
					| res |
					GsProcess _current
						breakpointLevel: 0;
						debugActionBlock: nil.	"any errors at this point should go straight to GCI"
					theDebugProcess suspend.
					res := debuggerService
						openDebuggerOnClientForProcess: theDebugProcess
						exception: ex.
					res ] forkAt: Processor userInterruptPriority.
					ex isResumable
						ifFalse: [ 
							"cannot resume from a not-resumable Exception."
							^ RsrNonresumableError
								signal: 'cannot resume from a not-resumable Exception' ].
					debuggerService resumptionValue	"necessary" ].
	doitResult := aString
		evaluateInContext: (Object _objectForOop: contextOop)
		symbolList: Rowan image symbolList
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

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> printIt: aString usingDebugger: debuggerService contextOop: contextOop [
	self
		gsDebugger_07: aString
		usingDebugger: debuggerService
		procName: 'SpkScaffoldingServiceServer>>printIt:usingDebugger:contextOop:'
		contextOop: contextOop.
	doitResult := doitResult printString
]

{ #category : 'process list' }
SpkScaffoldingServiceServer >> processList [
	| allP rpt |
	processList := Dictionary new.
	rpt := String new.
	allP := Processor allProcesses.
	allP
		do: [ :aProc | 
			| procName |
			procName := self processReportString: aProc.
			processList at: procName put: aProc _reportString ].
	^ processList
]

{ #category : 'process list' }
SpkScaffoldingServiceServer >> processReportString: aGsProcess [
	| s |
	s := String new.
	s add: 'GsProcess ('.
	aGsProcess name isEmpty not
		ifTrue: [ s add: 'name=' , aGsProcess name , ', ' ].
	s add: 'oop=' , aGsProcess asOop asString , ', '.
	s
		add: 'status=';
		add: aGsProcess _statusString;
		add: ', '.
	s
		add: 'priority=';
		add: aGsProcess priority printString;
		add: ', '.
	s
		add: 'type=';
		add: aGsProcess processType printString;
		add: ')'.
	s lf.
	^ s
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> processServiceFor: aSuspendedGsProcess [
	"return a process service with embedded frame services (wrapped Rowan services) for the given process"

	^ SpkScaffoldingDebugProcessServiceServer
		onSuspendedProcess: aSuspendedGsProcess
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> setBreakpointForClass: className meta: isMeta selector: selector atStepPoint: stepPoint [
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
