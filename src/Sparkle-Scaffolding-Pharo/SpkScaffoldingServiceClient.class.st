Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingAbstractServiceClient',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> clearAllBreaks_01 [

	"
	clear all breakpoints
	"

	<example>
	(SpkScaffoldingServiceClient new registerWith:
		           self connection) clearAllBreaks
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> closeConnection_01 [

	"
	close the RSR connection
	"

	<example>
	 self closeConnection 
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_01 [

	"
	Simulate a doit initiated in Pharo and executed in GemStone that results in a MNU
		for gsDebugger_01:, when an error is encountered on the server, a message is sent
		to the client from the server to bring up inspector on 7.
	This is a prelude to bringing up a debugger tool on the cient.
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	service gsDebugger_01: '7 foo'
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_02 [

	"
	Simulate a doit initiated in Pharo and executed in GemStone that results in a MNU
		for gsDebugger_02:.
	When an error is encountered on the server, an inspector is opened on the 
		printString of the stack.
	Another prelude to bringing up a debugger tool on the cient.
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	service gsDebugger_02: '7 foo'
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_03 [

	"the delay has to be long enough to let the server do it's thing and open an inspector on the stack"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	[ service gsDebugger_03: '7 foo' ] forkNamed:
		'Sparkle Scaffolding - keep connection alive until timeout'
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_04 [

	"open inspector on the SpkScaffoldingService that will have a 
		SpkScaffoldingProcessService instance with the debugProcess 
		and stack frames (wrapping rownan process service and frame 
		services)"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_04: '#() at: 1')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_05 [

	"trigger exception during doit and rely on debugActionBlock to handle the exception. The
		catch block is expected to be triggered and the <reason> will have a stack dump with the
		Halt. "

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_05: '#() at: 1')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06a [

	"return doitResult after error-free execution"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_06: '{3+4} at: 1')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06b [

	"
		trigger exception during doit and expect to trigger a remote debugger (inspector with option to
		resume (ala debugger_04)).
		
		Note that you can send resume to the debugger service in the inspector
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_06: '7 halt')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06c [

	"trigger an MNU"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_06: '7 foo')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06d [

	"trigger an error"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_06: '7 error: ''oops''')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06e [

	"
		trigger exception during doit and expect to trigger a remote debugger (inspector with option to
		resume (ala debugger_04)).
		
		 send resumeWith: 8 ... see whats happening (note using pause in the expression to debug it
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_06: '#() at: 1')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06f [

	"
		trigger a halt in a mock class designed to exercise the various step options ... result should be
			an array of strings. the following debugger commands can be executed in the inspector/debugger
			1. self resume
			2. 
				self stepOverFromLevel: 20. ""SpkScaffoldingMockObject class >> example2 @2 line 4""
				self stepOverFromLevel: 21. ""SpkScaffoldingMockObject class >> example2 @3 line 5""
				self stepIntoFromLevel: 21. ""SpkScaffoldingMockObject class >> example2 @4 line 5"" -- not working yet
			3. self terminate
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_06: 'SpkScaffoldingMockObject example2')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } halt ] ]
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06g [

	"
		Set a breakpoint in a method in a mock class designed to exercise the various step options. 
		Upon resume, the result should be an array of strings. The following debugger commands can
		be executed in the inspector/debugger
			1. self resume
			2. 
				self stepThroughFromLevel: 21. ""SpkScaffoldingMockObject >> method1: @3 line 7""
				self stepOverFromLevel: 21. ""[] in SpkScaffoldingMockObject >> method1: @7 line 10""
				self stepOverFromLevel: 21. ""[] in SpkScaffoldingMockObject >> method1: @8 line 10""
				self stepOverFromLevel: 21. ""[] in SpkScaffoldingMockObject >> method1: @9 line 11""
				self stepOverFromLevel: 21. ""[] in SpkScaffoldingMockObject >> method1: @10 line 11""
				self stepOverFromLevel: 22. ""SpkScaffoldingMockObject >> method1: @3 line 7""
				self stepOverFromLevel: 21. ""SpkScaffoldingMockObject >> method1: @4 line 12""
			3. self terminate
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	service
		setBreakpointForClass: 'SpkScaffoldingMockObject'
		meta: false
		selector: #method1:
		atStepPoint: 3.
	(service gsDebugger_06: 'SpkScaffoldingMockObject example1')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } halt ] ]
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07a [

	"return doitResult after error-free execution"

	<example>
	| client sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07a - return doitResult after error-free execution';
		cr;
		show: '=========';
		cr.
	(client gsDebugger_07: '{3+4} at: 1')
		when: [ :result | 
			| doitResult |
			doitResult := result doitResult.
			doitResult = 7 ifFalse: [ 
				self error:
					'Incorrect result ' , doitResult printString , ' should be ''7''' ].
			sem signal.
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'doit result is ' , doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ].
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ', DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07b [

	"testDebugger_07b - trigger exception during doit and expect to trigger a remote debugger; resume execution, print stack to Transcript, resume execution and print result to Transcript"

	<example>
	| client debuggerClient sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07b - trigger exception during doit and expect to trigger a remote debugger; resume execution, print stack to Transcript, resume execution and print result to Transcript ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client gsDebugger_07: '7 halt' usingDebugger: debuggerClient)
		when: [ :result | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'doit result is ' , result doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself.
			sem signal ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			WorldState defer: [ 
				false ifTrue: [ 
					{ 
						'catch'.
						reason } inspect ] ] ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	debuggerClient resume. "resume execution"

	sem wait. "wait for result"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> debugger_07c [

	"trigger an MNU"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_07: '7 foo')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } inspect ] ]
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07c_01 [

	"testDebugger_07c_01 - trigger an MNU - expectCatch"

	<example>
	| client debuggerClient sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07c_01 - trigger an MNU - expectCatch and print result to Transcript ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client gsDebugger_07: '7 foo' usingDebugger: debuggerClient)
		when: [ :result | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED doit result is ' , result doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'EXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			sem signal ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	debuggerClient terminate. "resume execution"

	sem wait. "wait for result"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07c_02 [

	"testDebugger_07c_02 - trigger a Halt ; terminate process; expectCatch"

	<example>
	| client debuggerClient sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07c_02 - trigger a Halt ; terminate process; expectCatch and print result to Transcript ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client gsDebugger_07: '7 halt' usingDebugger: debuggerClient)
		when: [ :result | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED doit result is ' , result doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'EXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			sem signal ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	debuggerClient terminate. "resume execution"

	sem wait. "wait for result"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07d [

	"testDebugger_07d - trigger an error; terminate process; expectCatch"

	<example>
	| client debuggerClient sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07d - trigger an error; terminate process; expectCatch ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client gsDebugger_07: '7 error: ''oops''' usingDebugger: debuggerClient)
		when: [ :result | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED doit result is ' , result doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'EXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			sem signal ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	debuggerClient terminate. "resume execution"

	sem wait. "wait for result"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07e [

	"testDebugger_07e - trigger OffsetError during doit and expect to trigger a remote debugger; resumeWith: 8; terminate process"

	<example>
	| client debuggerClient sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07e - trigger OffsetError during doit and expect to trigger a remote debugger; resumeWith: 8; terminate process ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client gsDebugger_07: '#() at: 1' usingDebugger: debuggerClient)
		when: [ :result | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'EXPECTED doit result is ' , result doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself .
			sem signal ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	debuggerClient resumeWith: 8. "resume execution"

	sem wait. "wait for result"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07f [

	"testDebugger_07f - trigger a halt in SpkScaffoldingMockObject; debugger stepOverFromLevel:; debugger resume"

	<example>
	| client debuggerClient sem expressionResult X |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07f - trigger a halt in SpkScaffoldingMockObject; debugger stepOverFromLevel:; debugger resume ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client
		 gsDebugger_07: 'SpkScaffoldingMockObject example2'
		 usingDebugger: debuggerClient)
		when: [ :result | 
			expressionResult := result doitResult.
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'EXPECTED doit result is ' , expressionResult printString;
				cr;
				show: '=========';
				cr;
				yourself.
			sem signal ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	self assert:
		(X := debuggerClient messageText) = 'a Halt occurred (error 2709)'.

	Transcript
		cr;
		show: '=========';
		cr;
		show: 'STEP OVER';
		cr;
		show: '========='.

	debuggerClient stepOverFromLevel: 13.

	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	self assert: debuggerClient messageText
		=
		'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.

	debuggerClient resume. "resume execution"

	sem wait. "wait for result"

	self assert: expressionResult = { 'symbol'. '1'. '2.0' }.

	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07g [

	"testDebugger_07g - Set 3 breakpoints in SpkScaffoldingMockObject; stepThroughFromLevel:; resume; stepOverFromLevel:; clear breakpoints and resume"

	<example>
	| client debuggerClient sem expressionResult x |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.

	debuggerClient
		setBreakpointForClass: 'SpkScaffoldingMockObject'
		meta: false
		selector: #method1:
		atStepPoint: 3;
		setBreakpointForClass: 'SpkScaffoldingMockObject'
		meta: false
		selector: #method2:
		atStepPoint: 3;
		setBreakpointForClass: 'SpkScaffoldingMockObject'
		meta: false
		selector: #method1:
		atStepPoint: 10.

	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07g - Set 3 breakpoints in SpkScaffoldingMockObject; stepThroughFromLevel:; resume; stepOverFromLevel:; clear breakpoints and resume ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client
		 gsDebugger_07: 'SpkScaffoldingMockObject example1'
		 usingDebugger: debuggerClient)
		when: [ :result | 
			expressionResult := result doitResult.
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'EXPECTED doit result is ' , expressionResult printString;
				cr;
				show: '=========';
				cr;
				yourself.
			sem signal ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	self assert: (x := debuggerClient messageText)
		=
		'a Breakpoint occurred (error 6024), Method breakpoint encountered.'.
	self assert: (x := (debuggerClient frameAt: 14) label)
		=
		'a Breakpoint occurred (error 6024), Method breakpoint encountered.'.

	Transcript
		cr;
		show: '=========';
		cr;
		show: 'STEP THROUGH';
		cr;
		show: '========='.

	debuggerClient stepThroughFromLevel: 14.

	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	self assert: debuggerClient messageText
		=
		'a Breakpoint occurred (error 6023), Single-step breakpoint encountered.'.
	self assert: (x := (debuggerClient frameAt: 14) label)
		= '''[] in SpkScaffoldingMockObject >> method1: @7 line 10'.

	debuggerClient 
		clearAllBreaks;
		resume. "resume execution"

	sem wait. "wait for result"

	self assert: expressionResult = { 'symbol'. '1'. '2.0' }.

	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> debugger_07h [

	"
		trigger a halt in a forked process in a mock class designed to exercise the various step options
			... result should be an array of strings. 
			The following debugger commands can be executed in the inspector/debugger:
			1. self resume
			2. self terminate
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_07: 'SpkScaffoldingMockObject example3')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } halt ] ]
]

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> debugger_07i [

	"
		two processes, halt in forked process, wait on sempaphore (signalled if resumed) from forked process, 
			then halt in original process and return answer from example2 as result (#('symbol' '1' '2.0')).
			The following debugger commands can be executed in the inspector/debugger:
			1. self resume
			2. self terminate
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_07: 'SpkScaffoldingMockObject example4')
		when: [ :result | 
			WorldState defer: [ 
				{ 
					'when'.
					result.
					result doitResult } inspect ] ]
		catch: [ :reason | 
			WorldState defer: [ 
				{ 
					'catch'.
					reason } halt ] ]
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07q [

	"testDebugger_07q - trigger exception during doit and expect to trigger a remote debugger; terminate process after printing stack to Transcript"

	<example>
	| client debuggerClient sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07q - trigger exception during doit and expect to trigger a remote debugger; terminate process after printing stack to Transcript ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client gsDebugger_07: '7 halt' usingDebugger: debuggerClient)
		when: [ :result | self error: 'unexpected result' ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			sem signal ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	debuggerClient terminate. "resume execution"

	sem wait. "wait for CATCH"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07r [

	"testDebugger_07r - trigger exception during doit and expect to trigger a remote debugger; resume execution, print stack to Transcript, print frame 13 method source, resume execution and print result to Transcript"

	<example>
	| client debuggerClient sem |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07r - trigger exception during doit and expect to trigger a remote debugger; resume execution, print stack to Transcript, print frame 13 method source, resume execution and print result to Transcript ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client
		 gsDebugger_07: 'SpkScaffoldingMockObject example2'
		 usingDebugger: debuggerClient)
		when: [ :result | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'doit result is ' , result doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself.
			sem signal ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			WorldState defer: [ 
				false ifTrue: [ 
					{ 
						'catch'.
						reason } inspect ] ] ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	Transcript
		cr;
		show: '========= method source =========';
		cr;
		show: (debuggerClient methodSourceAt: 13);
		cr;
		show: '========='.

	debuggerClient resume. "resume execution"

	sem wait. "wait for result"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'new examples' }
SpkScaffoldingServiceClient class >> debugger_07s [

	"trigger a halt in SpkScaffoldingMockObject, then list frame inspector for frame 13; debugger resume in Transcript"

	<example>
	| client debuggerClient sem frame |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07s - trigger a halt in SpkScaffoldingMockObject, then list frame inspector for frame 13 in Transcript; debugger resume ';
		cr;
		show: DateAndTime now printString;
		cr;
		show: '=========';
		cr.
	(client
		 gsDebugger_07: 'SpkScaffoldingMockObject example2'
		 usingDebugger: debuggerClient)
		when: [ :result | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'doit result is ' , result doitResult printString;
				cr;
				show: '=========';
				cr;
				yourself.
			sem signal ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			WorldState defer: [ 
				false ifTrue: [ 
					{ 
						'catch'.
						reason } inspect ] ] ].
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) wait. "wait for stack to print"

	frame := debuggerClient frameAt: 13.
	Transcript
		cr;
		show: '========= FRAME VARS ========='.
			frame variableMap
		keysAndValuesDo: [ :varName :value | Transcript cr; show: varName printString , ' -> ' , value printString ].
Transcript		cr;
		show: '========='.

	debuggerClient resume. "resume execution"

	sem wait. "wait for result"
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS ' , DateAndTime now printString;
		cr;
		show: '=========';
		cr
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> doit_01 [

	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith: 
		           self connection.
	(service doit_01: '3+4') inspect
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> doit_02 [

	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	<example>
	| service x |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	x := (service doit_02: '3+4') doitResult.
	x inspect
]

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> processGC_01 [

	"get rid of suspended processes that are running the examples "

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	service gcSuspendedProcesses inspect
]

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> processList_01 [

	"return dictionary of process stackes keyed by process oop for all scheduled processes in server"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	service processList inspect
]

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> resetConnection_01 [

	"
	summarily drop the connection
	"

	<example>
	Connection := nil.
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_01: aString [

	^ (remoteSelf doit_01: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_02: aString [

	^ (remoteSelf doit_02: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_01: aString [

	^ (remoteSelf gsDebugger_01: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_02: aString [

	^ (remoteSelf gsDebugger_02: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_03: aString [

	^ (remoteSelf gsDebugger_03: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_04: aString [

	^ remoteSelf gsDebugger_04: aString
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_05: aString [

	^ remoteSelf gsDebugger_05: aString
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_06: aString [

	^ remoteSelf gsDebugger_06: aString
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_07: aString [

	^ remoteSelf
		  gsDebugger_07: aString
]

{ #category : 'new debugger' }
SpkScaffoldingServiceClient >> gsDebugger_07: aString usingDebugger: debuggerService [
	^ remoteSelf gsDebugger_07: aString usingDebugger: debuggerService
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openDebuggerOnClient [

	Transcript
		cr;
		show: self class name
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openInspectorOnClient [

	self halt.
]
