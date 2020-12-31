Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingService',
	#classVars : [
		'Connection'
	],
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'connections' }
SpkScaffoldingServiceClient class >> closeConnection [

	(Connection notNil and: [ Connection isOpen]) ifTrue: [ 
		Connection close ].
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> closeConnection_01 [

	"
	close the RSR connection
	"

	<example>
	 self closeConnection 
]

{ #category : 'connections' }
SpkScaffoldingServiceClient class >> connection [

	(Connection isNil or: [Connection isOpen not ]) ifTrue: [ self initiateConnection ].
	^Connection
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
	service gsDebugger_02: '7 foo'
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_03 [

	"the delay has to be long enough to let the server do it's thing and open an inspector on the stack"

	<example>
	| service |
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
	service := self connection serviceFor: #SpkScaffoldingService.
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
				self stepOverFromLevel: 19
				self stepOverFromLevel: 20
				self stepIntoFromLevel: 20 -- not working yet
	"

	<example>
	| service |
	service := self connection serviceFor: #SpkScaffoldingService.
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
SpkScaffoldingServiceClient class >> doit_01 [
	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	<example>
	| service |
	service := self connection serviceFor: #SpkScaffoldingService.
	(service doit_01: '3+4') inspect

]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> doit_02 [

	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	<example>
	| service x |
	service := self connection serviceFor: #SpkScaffoldingService.
	x := (service doit_02: '3+4') doitResult.
	x inspect

]

{ #category : 'connections' }
SpkScaffoldingServiceClient class >> initiateConnection [

	| host port initiator |
	host := '0.0.0.0'.
	port := 7652.
	initiator := RsrInitiateConnection host: host port: port.
	^ Connection := initiator connect
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> processList_01 [

	"return dictionary of process stackes keyed by process oop for all scheduled processes in server"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	<example>
	| service |
	service := self connection serviceFor: #SpkScaffoldingService.
	service processList inspect

]

{ #category : 'services' }
SpkScaffoldingServiceClient class >> serviceFor: aServiceName [


	^self connection serviceFor: aServiceName
	
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> doitExceptionDescription [

	^ remoteSelf doitExceptionDescription wait
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> doitResult [

	^ doitResult 
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doitStack [
	^ remoteSelf doitStack wait
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
SpkScaffoldingServiceClient >> openDebuggerOnClient [

	self doitStack inspect
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openInspectorOnClient [

	self doitExceptionDescription inspect
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> processList [ 

	^ processList ifNil: [ processList := remoteSelf processList wait ]
]
