Class {
	#name : 'SpkScaffoldingDebuggerTest',
	#superclass : 'RsrSystemTestCase',
	#instVars : [
		'doitProcess'
	],
	#category : 'Sparkle-Scaffolding-GemStone-Test'
}

{ #category : 'running' }
SpkScaffoldingDebuggerTest >> setUp [

	super setUp.
	self initializeSocketConnections
]

{ #category : 'running' }
SpkScaffoldingDebuggerTest >> tearDown [

	doitProcess ifNotNil: [ doitProcess terminate].
	super tearDown
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_06a [
	"return doitResult after error-free execution"

	| client promise result |
	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	promise := client gsDebugger_07: '{3+4} at: 1'.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 7
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_06b [
	"
		trigger exception during doit and expect to trigger a remote debugger; resume execution
	"

	| client server sem debuggerClient |
	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.
	doitProcess := [ 
	| promise result |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client gsDebugger_07: '7 halt' usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 7.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.
	debuggerClient processService resume.
	sem wait	"assertion passed"
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_06c [
	"trigger an MNU"

	| client server sem debuggerClient |
	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client gsDebugger_07: '7 foo' usingDebugger: debuggerClient.
	self expectCatch: promise ] forkAt: Processor userSchedulingPriority.

	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.
	doitProcess terminate.
	sem wait	"assertion passed"
]
