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

	""

	<example>
	| client debuggerClient |
	client := SpkScaffoldingServiceClient new registerWith:
		          self connection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	Transcript clear.
	Transcript
		cr;
		show: '=========';
		cr;
		show:
			'testDebugger_07b - trigger exception during doit and expect to trigger a remote debugger; resume execution';
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
					yourself ]
		catch: [ :reason | 
			Transcript cr; show: 'here is johnny'.
			WorldState defer: [ 
			false ifTrue: [   	{ 
					'catch'.
					reason } inspect ] ] ].
	Transcript
		cr;
		show: '=========';
		cr;
		show: 'SUCCESS';
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

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> debugger_07d [

	"trigger an error"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_07: '7 error: ''oops''')
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

{ #category : 'active examples' }
SpkScaffoldingServiceClient class >> debugger_07e [

	"
		trigger exception during doit and expect to trigger a remote debugger.
		The following debugger commands can be executed in the inspector/debugger:
			1. self resumeWith: 8
			2. self terminate
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_07: '#() at: 1')
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
SpkScaffoldingServiceClient class >> debugger_07f [

	"
		trigger a halt in a mock class designed to exercise the various step options ... result should be
			an array of strings. the following debugger commands can be executed in the inspector/debugger
			1. self resume
			2. 
				self stepOverFromLevel: 7. ""SpkScaffoldingMockObject class >> example2 @2 line 4""
				self stepOverFromLevel: 18. ""SpkScaffoldingMockObject class >> example2 @3 line 5""
				self stepIntoFromLevel: 13. ""SpkScaffoldingMockObject class >> example2 @4 line 5"" -- not working yet
			3. self terminate
	"

	<example>
	| service |
	service := SpkScaffoldingServiceClient new registerWith:
		           self connection.
	(service gsDebugger_07: 'SpkScaffoldingMockObject example2')
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
SpkScaffoldingServiceClient class >> debugger_07g [

	"
		Set 2 breakpoints in mock class designed to exercise the various step options. 
		Upon second resume, the result should be an array of strings. The following debugger commands can
		be executed in the inspector/debugger
			1. self resume
			2. 
				self stepThroughFromLevel: 13. ""SpkScaffoldingMockObject >> method1: @3 line 7""
				self resume	""continue to next breakpoint""
				self stepOverFromLevel: 13. ""SpkScaffoldingMockObject >> method2: @3 line 4""
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
		atStepPoint: 3;
		setBreakpointForClass: 'SpkScaffoldingMockObject'
		meta: false
		selector: #method2:
		atStepPoint: 3.
	(service gsDebugger_07: 'SpkScaffoldingMockObject example1')
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

	self doitStack inspect
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openInspectorOnClient [

	self doitExceptionDescription inspect
]
