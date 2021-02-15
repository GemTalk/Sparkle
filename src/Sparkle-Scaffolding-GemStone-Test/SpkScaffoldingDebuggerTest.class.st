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

	| client server sem debuggerClient |
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
	| promise result |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client gsDebugger_07: '7 halt' usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 7.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	debuggerClient processService resume.

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07c [
	"trigger an MNU"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07c - trigger an MNU'.
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

	| client server sem debuggerClient |
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
	| promise result |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client gsDebugger_07: '#() at: 1' usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 8.
	sem signal ]
		ensure: [ debuggerClient terminate ] ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a OffsetError occurred (error 2003), reason:objErrBadOffsetIncomplete, max:0 actual:1'.

	debuggerClient resumeWith: 8.

	sem wait.	"assertion passed"

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

	| client server sem debuggerClient |
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
	debuggerClient stepOverFromLevel: 12.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient messageText
		equals:
			'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
	self
		assert: (debuggerClient rowanFrameServices at: 15) label
		equals: 'SpkScaffoldingMockObject class >> example2 @2 line 4'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07g [
	"
		Set 2 breakpoints in SpkScaffoldingMockObject ... first breakpoint will allow us to test 
			1. stepThroughFromLevel:; resume to hit second breakpoint, 
			2. stepOverFromLevel: to confirm we've returned to calling method ... and then done
	"

	| client server sem debuggerClient |
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07g - Set 2 breakpoints in SpkScaffoldingMockObject ... first breakpoint will allow us to test; stepThroughFromLevel:; resume to hit second breakpoint; stepOverFromLevel: to confirm we''ve returned to calling method ... and then done'.
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

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07h [
	"
		trigger a halt in a forked process on SpkScaffoldingMockObject and resume ... result of execution dumped to log
	"

	| client server sem debuggerClient |
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

	| client server sem debuggerClient |
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
	| promise result |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example4'
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
		equals: 'SpkScaffoldingMockObject class >> example4 @9 line 16'.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient resume.

	sem wait.	"doitProcess forked"

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
		gsDebugger_07: 'RsrNonresumableError signal: ''oh oh'''
		usingDebugger: debuggerClient) wait ]
		ensure: [debuggerClient terminate].
	self assert: false description: 'should not get here' ]
		forkAt: Processor userSchedulingPriority.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient messageText equals: 'oh oh'.
	self
		assert: (debuggerClient rowanFrameServices at: 7) label
		equals:
			'RsrNonresumableError (AbstractException) >> _signalToDebugger @7 line 4'.

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
				equals: 'cannot resume from a not-resumable Exception'.
			self
				assert: (debuggerClient rowanFrameServices at: 7) label
				equals:
					'RsrNonresumableError (AbstractException) >> _signalToDebugger @7 line 4'.

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

true ifTrue: [ 
"halts test runs when it fails"
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
		gsDebugger_07:
			'SpkScaffoldingDebuggerServiceClient debuggerSemaphore signal. [true] whileTrue: []'
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

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07l [
	"
		Almost out of memory
	"

	| client server debuggerClient sem softBreakClient |
	sem := Semaphore new.	"pause the test to allow for process debugging"
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07l - almost out of memory'.
	GsFile gciLogServer: '========='.
true ifTrue: [ 
"halts test runs when it fails"
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
		Stack overflow
	"

	| client server debuggerClient sem softBreakClient |
	sem := Semaphore new.	"pause the test to allow for process debugging"
	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'testDebugger_07m - stack overflow'.
	GsFile gciLogServer: '========='.

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

	| client server sem debuggerClient |
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
		equals:39.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'TRIM STACK'.
	GsFile gciLogServer: '========='.
	debuggerClient trimStackToLevel: 18.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self
		assert: debuggerClient rowanFrameServices size
		equals:22.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'CLEAR BREAKPOINTS & RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient
		clearAllBreaks;
		resume.

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07o [
	"
		save method (home context) and save method (embedded block)
	"

	| client server sem debuggerClient |
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
	| promise result |
	GsProcess _current name: self printString , ' doit proc'.
	promise := client
		gsDebugger_07: 'SpkScaffoldingMockObject example5'
		usingDebugger: debuggerClient.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: SpkScaffoldingMockObject _optionArray printString.
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

	self assert: debuggerClient rowanFrameServices size equals: 37.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'compile method at frame 14'.
	GsFile gciLogServer: '========='.
	debuggerClient
		compileMethodSource:
			(SpkScaffoldingMockObject compiledMethodAt: #'method3') sourceString
		at: 14.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.

	self assert: debuggerClient rowanFrameServices size equals: 22.

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'CLEAR BREAKPOINTS & RESUME'.
	GsFile gciLogServer: '========='.
	debuggerClient
		clearAllBreaks;
		resume.

	sem wait.	"assertion passed"

	GsFile gciLogServer: '========='.
	GsFile gciLogServer: 'SUCCESS'.
	GsFile gciLogServer: '========='
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDebugger_07p [
	"
		Trigger an exceiption in a static handler and open debugger
	"

	| client server sem debuggerClient staticHandler message |
	GsFile gciLogServer: '========='.
	GsFile
		gciLogServer:
			'testDebugger_07p -Trigger an exceiption in a static handler and open debugger'.
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
