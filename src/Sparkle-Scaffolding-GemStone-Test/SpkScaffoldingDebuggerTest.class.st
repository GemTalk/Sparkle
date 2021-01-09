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
	self initializeSocketConnections.
	SpkScaffoldingDebuggerServiceClient resetDebuggerSemaphore
]

{ #category : 'running' }
SpkScaffoldingDebuggerTest >> tearDown [
	doitProcess ifNotNil: [ doitProcess terminate ].
	SpkScaffoldingDebuggerServiceClient resetDebuggerSemaphore.
	super tearDown
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07a [
	"return doitResult after error-free execution"

	| client promise result |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07a'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	promise := client gsDebugger_07: '{3+4} at: 1'.
	result := (self expectWhen: promise) doitResult.

	self assert: result equals: 7.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07b [
	"
		trigger exception during doit and expect to trigger a remote debugger; resume execution
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07b'.
	GsFile gciLogServer: '========='.

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

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07c [
	"trigger an MNU"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07c'.
	GsFile gciLogServer: '========='.

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

	sem wait.	"expected catch and got it"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07d [
	"trigger an error"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07d'.
	GsFile gciLogServer: '========='.

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

	sem wait.	"expected catch and got it"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07e [
	"
		trigger OffsetError during doit and expect to trigger a remote debugger.
		Use `self resumeWith: 8`
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07e'.
	GsFile gciLogServer: '========='.

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

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07f [
	"
		trigger a halt in SpkScaffoldingMockObject
			1. debugger stepOverFromLevel: 12.
			2.	debugger resume
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07f'.
	GsFile gciLogServer: '========='.

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
	self
		assert: result
		equals:
			{'symbol'.
			'1'.
			'2.0'}.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 12) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'STEP OVER'.
	GsFile gciLogServer: '========='.
	debuggerClient stepOverFromLevel: 12.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject class >> example2 @3 line 5'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07g [
	"
		Set 2 breakpoints in SpkScaffoldingMockObject ... first breakpoint will allow us to test stepThroughFromLevel:; resume to hit second
			breakpoint, then done
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07g'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new
		registerWith: connectionA;
		synchronize.
	sem := Semaphore new.

	debuggerClient
		setBreakpointForClass: 'SpkScaffoldingMockObject'
			meta: false
			selector: #'method1:'
			atStepPoint: 3;
		setBreakpointForClass: 'SpkScaffoldingMockObject'
			meta: false
			selector: #'method2:'
			atStepPoint: 3.

	doitProcess := [ 
	| promise result |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example1'
		usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self
		assert: result
		equals:
			{'symbol'.
			'1'.
			'2.0'}.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals: 'a Breakpoint occurred (error 6005), Method breakpoint encountered.'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject >> method1: @3 line 7'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals: 'a Breakpoint occurred (error 6005), Method breakpoint encountered.'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject >> method2: @3 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'CLEAR BREAKPOINTS & RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient
		clearAllBreaks;
		resume.

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07h [
	"
		trigger a halt in a forked process on SpkScaffoldingMockObject and resume ... result of execution dumped to log
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07h'.
	GsFile gciLogServer: '========='.

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
		gsDebugger_07: 'SpkScaffoldingMockObject example3'
		usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 'forked'.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	sem wait.	"doitProcess forked"
	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 12) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.
	self assert: SpkScaffoldingMockObject forkedProcessResult isNil.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.	"semaphore signaled in SpkScaffoldingMockObject example3 after forkedt process is resumed"

	self
		assert: SpkScaffoldingMockObject forkedProcessResult
		equals:
			{'symbol'.
			'1'.
			'2.0'}.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07i [

	"
		two processes, halt in forked process, wait on sempaphore (signalled if resumed) from forked process, 
			then halt in original process and return answer from example2 as result (#('symbol' '1' '2.0')).
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07i'.
	GsFile gciLogServer: '========='.

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
		gsDebugger_07: 'SpkScaffoldingMockObject example4'
		usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals:{'symbol'.
			'1'.
			'2.0'}.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 12) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 12) label
		equals: 'SpkScaffoldingMockObject class >> example4 @9 line 16'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.

	sem wait.	"doitProcess forked"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='.
]
