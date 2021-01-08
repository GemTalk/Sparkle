Class {
	#name : 'SpkScaffoldingDebuggerTest',
	#superclass : 'RsrSystemTestCase',
	#instVars : [
		'doitProcess'
	],
	#category : 'Sparkle-Scaffolding-GemStone-Test'
}

{ #category : 'running' }
SpkScaffoldingDebuggerTest >> runCase [
	| tornDown |
	self resources do: [:each | each availableFor: self].
	[ self setUp.
	  self performTest
        ] ensure: [
	  tornDown ifNil:[
		tornDown := true .
		self tearDown
	  ]
        ]
]

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
SpkScaffoldingDebuggerTest >> testDebugger_07a [
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
SpkScaffoldingDebuggerTest >> testDebugger_07b [
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
SpkScaffoldingDebuggerTest >> testDebugger_07c [
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
	self expectCatch: promise.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a MessageNotUnderstood occurred (error 2010), a SmallInteger does not understand  #''foo'''.	"nothing left to do, but turn out the lights"

	debuggerClient terminate.

	sem wait	"expected catch and got it"
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07d [
	"trigger an error"

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
	promise := client
		gsDebugger_07: '7 error: ''oops'''
		usingDebugger: debuggerClient.
	self expectCatch: promise.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'oops'.	"nothing left to do, but turn out the lights"

	debuggerClient terminate.

	sem wait	"expected catch and got it"
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07e [
	"
		trigger OffsetError during doit and expect to trigger a remote debugger.
		Use `self resumeWith: 8`
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
	promise := client gsDebugger_07: '#() at: 1' usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 8.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a OffsetError occurred (error 2003), reason:objErrBadOffsetIncomplete, max:0 actual:1'.

	debuggerClient resumeWith: 8.

	sem wait	"assertion passed"
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07f [
	"
		trigger a halt in SpkScaffoldingMockObject
			1. debugger stepOverFromLevel: 12.
			2.	debugger resume
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
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example2'
		usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: {}.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 12) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

GsFile gciLogServer: 'STEP OVER'.
	debuggerClient stepOverFromLevel: 12.

	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject class >> example2 @3 line 5'.

GsFile gciLogServer: 'RESUME'.
	debuggerClient resume.

	sem wait	"assertion passed"
]
