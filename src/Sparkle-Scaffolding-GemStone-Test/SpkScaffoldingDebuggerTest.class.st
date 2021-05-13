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
	GsFile gciLogServer: 'testDebugger_07a - return doitResult after error-free execution'.
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

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07b - trigger exception during doit and expect to trigger a remote debugger; resume execution'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.
	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc (_07b)'.
	promise := client gsDebugger_07: '7 halt' usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	debuggerClient resume.

	sem wait.	"run assertion"
	self assert: expressionResult equals: 7.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07c_01 [
	"trigger an MNU - expectCatch"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07c_01 - trigger an MNU - expectCatch'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc (_07c_01)'.
	promise := client gsDebugger_07: '7 foo' usingDebugger: debuggerClient.
	self expectCatch: promise.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a MessageNotUnderstood occurred (error 2010), a SmallInteger does not understand  #''foo'''.	"nothing left to do, but turn out the lights"

	debuggerClient terminate.

	sem wait.	"expected catch and got it"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07c_02 [
	"trigger a Halt ; terminate process; expectCatch"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07c_02 - trigger a Halt ; terminate process; expectCatch'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc (_07c_02)'.
	promise := client gsDebugger_07: '7 halt' usingDebugger: debuggerClient.
	self expectCatch: promise.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a Halt occurred (error 2709)'.	"nothing left to do, but turn out the lights"

	debuggerClient terminate.

	sem wait.	"expected catch and got it"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07d [
	"trigger an error"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07d - trigger an error'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: '7 error: ''oops'''
		usingDebugger: debuggerClient.
	self expectCatch: promise.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'oops'.	"nothing left to do, but turn out the lights"

	debuggerClient terminate.

	sem wait.	"expected catch and got it"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07e [
	"
		trigger OffsetError during doit and expect to trigger a remote debugger.
		Use `self resumeWith: 8`
	"

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07e - trigger OffsetError during doit and expect to trigger a remote debugger. Use `self resumeWith: 8`'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client gsDebugger_07: '#() at: 1' usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a OffsetError occurred (error 2003), reason:objErrBadOffsetIncomplete, max:0 actual:1'.

	debuggerClient resumeWith: 8.

	sem wait.	"run assertion"
	self assert: expressionResult equals: 8.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07f [
	"
		trigger a halt in SpkScaffoldingMockObject
			1. debugger stepOverFromLevel: 12.
			2.	debugger resume
	"

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07f - trigger a halt in SpkScaffoldingMockObject; debugger stepOverFromLevel:; debugger resume'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example2'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'STEP OVER'.
	GsFile gciLogServer: '========='.
	debuggerClient stepOverFromLevel: 13.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
	self
		assert: (debuggerClient rowanFrameServices at: 14) label
		equals: 'SpkScaffoldingMockObject class >> example2 @3 line 5'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.

	sem wait.	"run assertion"
	self
		assert: expressionResult
		equals:
			{'symbol'.
			'1'.
			'2.0'}.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07g [
  "
    Set 3 breakpoints in SpkScaffoldingMockObject ... first breakpoint will allow us to test 
      1. stepThroughFromLevel:; resume to hit second breakpoint, 
      2. stepOverFromLevel: to confirm we've returned to calling method ... and then done
  "

  | client server sem debuggerClient expressionResult |
  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'testDebugger_07g - Set 3 breakpoints in SpkScaffoldingMockObject ... first breakpoint will allow us to test; stepThroughFromLevel:; resume to hit second breakpoint; stepOverFromLevel: to confirm we''ve returned to calling method ... and then done'.
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
      atStepPoint: 3;
    setBreakpointForClass: 'SpkScaffoldingMockObject'
      meta: false
      selector: #'method1:'
      atStepPoint: 10.

  doitProcess := [ 
  [ 
  | promise |
  GsProcess _current name: self printString , ' doit proc'.
  promise := client
    gsDebugger_07: 'SpkScaffoldingMockObject example1'
    usingDebugger: debuggerClient.
  expressionResult := (self expectWhen: promise) doitResult.
  sem signal ]
    ensure: [ debuggerClient terminate ] ]
    forkAt: Processor userSchedulingPriority.
  SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

  self
    assert: debuggerClient messageText
    equals: 'a Breakpoint occurred (error 6024), Method breakpoint encountered.'.
  self
    assert: (debuggerClient rowanFrameServices at: 14) label
    equals: 'SpkScaffoldingMockObject >> method1: @3 line 7'.

  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'STEP THROUGH'.
  GsFile gciLogServer: '========='.
  debuggerClient stepThroughFromLevel: 14.
  SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

  self
    assert: debuggerClient messageText
    equals:
      'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
  self
    assert: (debuggerClient rowanFrameServices at: 14) label
    equals: '[] in SpkScaffoldingMockObject >> method1: @7 line 10'.

  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'STEP INTO'.
  GsFile gciLogServer: '========='.
  debuggerClient stepIntoFromLevel: 14.
  SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

  self
    assert: debuggerClient messageText
    equals:
      'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
  self
    assert: (debuggerClient rowanFrameServices at: 14) label
    equals: 'SpkScaffoldingMockObject >> method2: @1 line 1'.

  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'RESUME'.
  GsFile gciLogServer: '========='.
  debuggerClient resume.
  SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

  self
    assert: debuggerClient messageText
    equals: 'a Breakpoint occurred (error 6024), Method breakpoint encountered.'.
  self
    assert: (debuggerClient rowanFrameServices at: 14) label
    equals: 'SpkScaffoldingMockObject >> method2: @3 line 4'.

  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'STEP OVER'.
  GsFile gciLogServer: '========='.
  debuggerClient stepOverFromLevel: 14.
  SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

  self
    assert: debuggerClient messageText
    equals:
      'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
  self
    assert: (debuggerClient rowanFrameServices at: 14) label
    equals: '[] in SpkScaffoldingMockObject >> method1: @8 line 10'.

  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'CLEAR BREAKPOINTS & RESUME'.
  GsFile gciLogServer: '========='.
  debuggerClient
    clearAllBreaks;
    resume.

  sem wait.  "run assertion"
  self
    assert: expressionResult
    equals:
      {'symbol'.
      '1'.
      '2.0'}.
  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'SUCCESS'.
  GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07h [
	"
		trigger a halt in a forked process on SpkScaffoldingMockObject and resume ... result of execution dumped to log
	"

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07h - trigger a halt in a forked process on SpkScaffoldingMockObject and resume ... result of execution dumped to log'.
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
		gsDebugger_07: 'SpkScaffoldingMockObject example3'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	sem wait.	"doitProcess forked"
	self assert: expressionResult equals: 'forked'.
	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
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
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07i [
	"
		two processes, halt in forked process, wait on sempaphore (signalled if resumed) from forked process, 
			then halt in original process and return answer from example2 as result (#('symbol' '1' '2.0')).
	"

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07i - two processes, halt in forked process, wait on sempaphore (signalled if resumed) from forked process, then halt in original process and return answer from example2 as result (#(''symbol'' ''1'' ''2.0''))'.
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
		gsDebugger_07: 'SpkScaffoldingMockObject example4'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject class >> example4 @7 line 14'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.

	sem wait.	"test assertion"
	self
		assert: expressionResult
		equals:
			{'symbol'.
			'1'.
			'2.0'}.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07j [
	"
		trigger nonresumable exception during doit ; attempt to resume execution several times
	"

	| client server sem debuggerClient count |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07j - trigger nonresumable exception during doit ; attempt to resume execution several times'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.
	doitProcess := [ 
	GsProcess _current name: self printString , ' doit proc'.
	[ 
	(client
		gsDebugger_07: 'SpkScaffoldingNonresumableError signal: ''oh oh'''
		usingDebugger: debuggerClient) wait ]
		ensure: [debuggerClient terminate].
	self assert: false description: 'should not get here' ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'oh oh'.
	self
		assert: (debuggerClient rowanFrameServices at: 7) label
		equals:
			'SpkScaffoldingNonresumableError (AbstractException) >> _signalToDebugger @8 line 5'.

	count := 1.
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME ' , count printString.
	GsFile gciLogServer: '========='.
	debuggerClient resume.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	3
		timesRepeat: [ 
			"infinite loop"
			self
				assert: debuggerClient messageText
				equals: 'cannot resume from a non-resumable Exception'.
			self
				assert: (debuggerClient rowanFrameServices at: 7) label
				equals:
					'Error (AbstractException) >> _signalToDebugger @8 line 5'.

			count := count + 1.
			GsFile gciLogServer: '========='.
			GsFile gciLogServer: 'RESUME ' , count printString.
			GsFile gciLogServer: '========='.
			debuggerClient resume.
			SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait ].

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07k [
	"
		launch a hot running doit ... interrupt ala soft break
	"

	| client server debuggerClient sem softBreakClient |
	sem := Semaphore new.	"pause the test to allow for process debugging"
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07k - launch a hot running doit ... interrupt ala soft break'.
	GsFile gciLogServer: '========='.
false ifTrue: [ 
(UserGlobals at: #Scaffolding_SKIP_during_TestSuite ifAbsent: [false]) ifTrue: [ 
GsFile gciLogServer: '***** HANGS instead of test failure'.
^self assert: false].
].
	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	softBreakClient := SpkScaffoldingSoftBreakServiceClient new
		registerWith: connectionA;
		synchronize.

	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	GsProcess _current priority: Processor userInterruptPriority.
	doitProcess := [ 
	[ 
	| promise result |
	GsProcess _current name: self printString , ' doit process'.
	promise := client
		gsDebugger_07:
			'| once |
	once := true.
	[true] whileTrue: [
		once ifTrue: [
			SpkScaffoldingDebuggerServiceClient debuggerSemaphore signal.
			once := false ]]'
		usingDebugger: debuggerClient
		procName: 'HOT proc'.
	result := (self expectWhen: promise) doitResult.
	self assert: false description: 'should never reach here' ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait."wait for hot loop to start"

	softBreakClient softBreak.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait. "wait for debugger to open"

	self assert: debuggerClient messageText equals: 'a Break occurred (error 2706)'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'Break (AbstractException) >> _signalAsync @6 line 21'.

	self
		assert: (debuggerClient rowanFrameServices at: 16) label
		equals: 'ControlInterrupt (AbstractException) >> _signalTimeout @3 line 15'.

	debuggerClient terminate.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07l [
	"
		Almost out of memory - NOTE this test should have 50Meg of TOC to run in a reasonable amount of time
	"

	| client server debuggerClient sem softBreakClient toc |
	sem := Semaphore new.	"pause the test to allow for process debugging"
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07l - almost out of memory'.
	GsFile gciLogServer: '========='.

	(toc := System gemConfigurationAt: #'GEM_TEMPOBJ_CACHE_SIZE') > 128000000
		ifTrue: [
			GsFile gciLogServer: '***** TOC (', toc printString , ') is too big to run in a reasonable amount of time should be less than 100M'.
			^self assert: false].

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	softBreakClient := SpkScaffoldingSoftBreakServiceClient new
		registerWith: connectionA;
		synchronize.

	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	GsProcess _current priority: Processor userInterruptPriority.
	doitProcess := [ 
	[ 
	| promise result |
	GsProcess _current name: self printString , ' doit process'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject almostOutOfMemory: 50'
		usingDebugger: debuggerClient
		procName: 'doit process'.
	result := (self expectWhen: promise) doitResult.
	self assert: false description: 'should never reach here' ]
		ensure: [ 
			"a process with a stack overflow cannot be sent #terminate"
			debuggerClient terminate ] ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.	"wait for debugger to open"

	self
		assert: debuggerClient messageText
		equals:
			'a AlmostOutOfMemoryError occurred (error 6022), Unknown error number'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'AlmostOutOfMemoryError (AbstractException) >> _signalAsync @6 line 21'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07m [
	"
		Stack overflow - NOTE this test requires 125M of TOC to run sucessfully
	"

	| client server debuggerClient sem softBreakClient toc |
	sem := Semaphore new.	"pause the test to allow for process debugging"
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07m - stack overflow'.
	GsFile gciLogServer: '========='.

	(toc := System gemConfigurationAt: #'GEM_TEMPOBJ_CACHE_SIZE') < 128000000
		ifTrue: [
			GsFile gciLogServer: '***** TOC (', toc printString , ') is too small to successfully run, should be greater than 125M'.
			^self assert: false].

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	softBreakClient := SpkScaffoldingSoftBreakServiceClient new
		registerWith: connectionA;
		synchronize.

	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	GsProcess _current priority: Processor userInterruptPriority.
	doitProcess := [ 
	[ 
	| promise result |
	GsProcess _current name: self printString , ' doit process'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject stackOverflow'
		usingDebugger: debuggerClient
		procName: 'doit process'.
	result := (self expectWhen: promise) doitResult.
	self assert: false description: 'should never reach here' ]
		ensure: [ 
			"a process with a stack overflow cannot be sent #terminate"
			debuggerClient terminate9 ] ] forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.	"wait for debugger to open"

	self
		assert: debuggerClient messageText
		equals:
			'a AlmostOutOfStack occurred (notification 2059), Smalltalk execution stack error, ''overflow during execution'''.
	self
		assert: (debuggerClient rowanFrameServices at: 9) label
		equals: 'SpkScaffoldingMockObject class >> stackOverflow @1 line 1'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07n [
	"
		set breakpoint, trim stack
	"

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07n - trim stack'.
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
		selector: #'method2:'
		atStepPoint: 3.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example1'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals: 'a Breakpoint occurred (error 6024), Method breakpoint encountered.'.
	self
		assert: (debuggerClient rowanFrameServices at: 14) label
		equals: 'SpkScaffoldingMockObject >> method2: @3 line 4'.

	self
		assert: (debuggerClient rowanFrameServices at: 18) label
		equals: 'SpkScaffoldingMockObject >> method1 @3 line 4'.

	self
		assert: debuggerClient rowanFrameServices size
		equals:40.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'TRIM STACK'.
	GsFile gciLogServer: '========='.
	debuggerClient trimStackToLevel: 18.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient rowanFrameServices size
		equals:23.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'CLEAR BREAKPOINTS & RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient
		clearAllBreaks;
		resume.

	sem wait.	"test assertion"
	self
		assert: expressionResult
		equals:
			{'symbol'.
			'1'.
			'2.0'}.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07o [
	"
		save method (home context) and save method (embedded block)
	"

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile
		gciLogServer:
			'testDebugger_07o - save method (home context) and save method (embedded block)'.
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
		selector: #'method3'
		atStepPoint: 6.	"inside block"

	doitProcess := [ 
	[ 
	| promise  |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example5'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals: 'a Breakpoint occurred (error 6024), Method breakpoint encountered.'.
	self
		assert: (debuggerClient rowanFrameServices at: 14) label
		equals: '[] in SpkScaffoldingMockObject >> method3 @6 line 4'.

	self assert: debuggerClient rowanFrameServices size equals: 38.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'compile method at frame 14'.
	GsFile gciLogServer: '========='.
	debuggerClient
		compileMethodSource:
			(SpkScaffoldingMockObject compiledMethodAt: #'method3') sourceString
		at: 14.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: (debuggerClient rowanFrameServices at: 1) label
		equals: 'SpkScaffoldingMockObject >> method3 @1 line 1'.
	self assert: debuggerClient rowanFrameServices size equals: 23.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'CLEAR BREAKPOINTS & RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient
		clearAllBreaks;
		resume.

	sem wait.	"test assertion"
	self assert: expressionResult equals: SpkScaffoldingMockObject _optionArray printString.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07p [
	"
		Trigger an exception in a static handler and open debugger
	"

	| client server sem debuggerClient staticHandler message |
	GsFile gciLogServer: '========='.
	GsFile
		gciLogServer:
			'testDebugger_07p -Trigger an exception in a static handler and open debugger'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	message := 'Caught the SpkScaffoldingError error with static handler'.
	staticHandler := SpkScaffoldingError
		addDefaultHandler: [ :ex | Error signal: message ].

	doitProcess := [ 
	[ 
	| promise result |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingError signal'
		usingDebugger: debuggerClient.
	result := self expectWhen: promise.
	self assert: false equals: 'should never get here' ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: message.
	self
		assert: (debuggerClient rowanFrameServices at: 16) label
		equals:
			'SpkScaffoldingError class (AbstractException class) >> signal @3 line 5'.

	self
		assert: (debuggerClient rowanFrameServices at: 12) label
		equals: 'Error class (AbstractException class) >> signal: @3 line 4'.

	Processor yield.	"just in case we promise was fulfilled"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07q [
	"
		trigger exception during doit and expect to trigger a remote debugger; resume execution
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile
		gciLogServer:
			'testDebugger_07q - trigger exception during doit and expect to trigger a remote debugger; terminate process after printing stack to Transcript'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.
	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client gsDebugger_07: '7 halt' usingDebugger: debuggerClient.
	self expectCatch: promise.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	debuggerClient terminate.

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07r [
	"
		trigger a halt in SpkScaffoldingMockObject, then list method source for frame 13; debugger resume
	"

	| client server sem debuggerClient expressionResult |

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07r - trigger a halt in SpkScaffoldingMockObject, then list method source for frame 13; debugger resume'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example2'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'STEP OVER'.
	GsFile gciLogServer: '========='.
GsFile gciLogServer: 'testDebugger_07r [0] before STEP OVER'.
	debuggerClient stepOverFromLevel: 13.
GsFile gciLogServer: 'testDebugger_07r [1] after STEP OVER'.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.
GsFile gciLogServer: 'testDebugger_07r [2] after wait'.

	self
		assert: debuggerClient messageText
		equals:
			'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
	self
		assert: (debuggerClient rowanFrameServices at: 14) label
		equals: 'SpkScaffoldingMockObject class >> example2 @3 line 5'.

	self
		assert: (debuggerClient methodSourceAt: 14)
		equals: 'example2
	"use this example until the trappability of breakpoints is sorted out"

	self halt.	"I''m here on purpose - used in a test"
	^ SpkScaffoldingMockObject new method1'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.

	debuggerClient resume.

	sem wait.	"run assertion"
	self
		assert: expressionResult
		equals:
			{'symbol'.
			'1'.
			'2.0'}.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07s [
	"
		trigger a halt in SpkScaffoldingMockObject, then list frame inspector for frame 13; debugger resume
	"

	| client server sem debuggerClient expressionResult frame |
	GsFile gciLogServer: '========='.
	GsFile
		gciLogServer:
			'testDebugger_07s - trigger a halt in SpkScaffoldingMockObject, then list frame inspector for frame 13; debugger resume'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example2'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'a Halt occurred (error 2709)'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'STEP OVER'.
	GsFile gciLogServer: '========='.
	debuggerClient stepOverFromLevel: 13.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
	frame := debuggerClient frameAt: 14.
	self
		assert: frame label
		equals: 'SpkScaffoldingMockObject class >> example2 @3 line 5'.

	GsFile gciLogServer: 'FRAME VARS'.
	GsFile gciLogServer: '========='.
	frame variableMap
		keysAndValuesDo: [ :varName :value | GsFile gciLogServer: '  ' , varName printString , '	' , value printString ].
	GsFile gciLogServer: '========='.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.

	sem wait.	"run assertion"
	self
		assert: expressionResult
		equals:
			{'symbol'.
			'1'.
			'2.0'}.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07t [
	"
		trigger MNU during doit, select frame 1 and then step over ... should get a broken promise in client and the stack 
		should not advance!
	"

	| client server sem debuggerClient expressionResult |
	GsFile gciLogServer: '========='.
	GsFile
		gciLogServer:
			'testDebugger_07t - trigger MNU during doit, select frame 1 and then step over'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.
	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: '1 foo. self halt.'
		usingDebugger: debuggerClient.
	expressionResult := (self expectWhen: promise) doitResult.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: (debuggerClient rowanFrameServices at: 1) label
		equals: 'ProcessorScheduler >> _switchFrom:to: @2 line 8'.
	self
		assert: (debuggerClient rowanFrameServices at: 13) label
		equals: 'Executed Code  @2 line 1'.	"step point of Executed Code prior to step"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'STEP OVER'.
	GsFile gciLogServer: '========='.
	[ debuggerClient stepOverFromLevel: 1 ]
		on: RsrBrokenPromise
		do: [ :brokenPromise | 
			| errorMessage |
			errorMessage := brokenPromise reason messageText.	"cannot set breakpoint error"
			self
				assert: (debuggerClient rowanFrameServices at: 13) label
				equals: 'Executed Code  @2 line 1'	"we are not expecting the step point to move - should be same as line 38" ].

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07u [
  "
    Trigger a breakpoint in SpkScaffoldingMockObject>>method1:  
      1. stepOutFromLevel:; to confirm we've stepped out of the block ... and then done
  "

  | client server sem debuggerClient expressionResult |
  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'testDebugger_07u - Set 3 breakpoints in SpkScaffoldingMockObject ... first breakpoint will allow us to test; stepThroughFromLevel:; resume to hit second breakpoint; stepOverFromLevel: to confirm we''ve returned to calling method ... and then done'.
  GsFile gciLogServer: '========='.

(UserGlobals at: #Scaffolding_SKIP_during_TestSuite ifAbsent: [false]) ifTrue: [ 
GsFile gciLogServer: '***** HANGS instead of test failure'.
^self assert: false].

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
      atStepPoint: 7.

  doitProcess := [ 
  [ 
  | promise |
  GsProcess _current name: self printString , ' doit proc'.
  promise := client
    gsDebugger_07: 'SpkScaffoldingMockObject example1'
    usingDebugger: debuggerClient.
  expressionResult := (self expectWhen: promise) doitResult.
  sem signal ]
    ensure: [ debuggerClient terminate ] ]
    forkAt: Processor userSchedulingPriority.
  SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

  self
    assert: debuggerClient messageText
    equals: 'a Breakpoint occurred (error 6024), Method breakpoint encountered.'.
  self
    assert: (debuggerClient rowanFrameServices at: 14) label
    equals: '[] in SpkScaffoldingMockObject >> method1: @7 line 10'.

  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'STEP OUT'.
  GsFile gciLogServer: '========='.
  debuggerClient stepOutFromLevel: 14.
  SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

  self
    assert: debuggerClient messageText
    equals:
      'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
  self
    assert: (debuggerClient rowanFrameServices at: 14) label
    equals: 'SpkScaffoldingMockObject >> method1: @4 line 12'.

  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'CLEAR BREAKPOINTS & RESUME'.
  GsFile gciLogServer: '========='.
  debuggerClient
    clearAllBreaks;
    resume.

  sem wait.  "run assertion"
  self
    assert: expressionResult
    equals:
      {'symbol'.
      '1'.
      '2.0'}.
  GsFile gciLogServer: '========='.
  GsFile gciLogServer: 'SUCCESS'.
  GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07v [
	"
    reproduce inifinite loop bug running `Time now` that produces an RsrUnsupportedObject exception
	"

	| client server sem debuggerClient reason |
	GsFile gciLogServer: '========='.
	GsFile
		gciLogServer:
			'testDebugger_07v - reproduce inifinite loop bug running `Time now` that produces an RsrUnsupportedObject exception'.
	GsFile gciLogServer: '========='.

	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new
		registerWith: connectionA;
		synchronize.
	sem := Semaphore new.

	doitProcess := [ 
	[ 
	| promise |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SmallTime fromMilliseconds: 52756739'
		usingDebugger: debuggerClient.
	reason := self expectCatch: promise.
	sem signal ]
		ensure: [  ] ] forkAt: Processor userSchedulingPriority.

	sem wait.	"run assertion"

GsFile gciLogServer: 'This assertion passes (reason class EQUALS RsrRemoteExceptionServer), but it does not make sense to me'.
	self assert: reason class equals: RsrRemoteExceptionServer.	"this is not a broken promise, as I expected"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]
