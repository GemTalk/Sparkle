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

	"same as debugger_04: ... but blocks forever ... ALT-. will cause the inspector to appear
		along with debugger"

	<example>
	| service |
	service := self connection serviceFor: #SpkScaffoldingService.
	service gsDebugger_03: '7 foo'
]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_04 [

	"the delay has to be long enough to let the server do it's thing and open an inspector on the stack"


	<example>
	| service |
	service := self connection serviceFor: #SpkScaffoldingService.
	[ service gsDebugger_03: '7 foo' ] forkNamed:
		'Sparkle Scaffolding - keep connection alive until timeout'.
	(Delay forMilliseconds: 500) wait

]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_05 [

	"open inspector on the SpkScaffoldingService that will have a 
		SpkScaffoldingProcessService instance with the debugProcess 
		and stack frames (wrapping rownan process service and frame 
		services)"

	<example>
	| service x |
	service := self connection serviceFor: #SpkScaffoldingService.
	[ x := service gsDebugger_04: '7 foo' ] forkNamed:
		'Sparkle Scaffolding - keep connection alive until timeout'.
	(Delay forMilliseconds: 500) wait.

]

{ #category : 'examples' }
SpkScaffoldingServiceClient class >> debugger_06 [

	"the UI process must be free to open the debugger ... not hung on sema wait"

	"now that this is not a test and the connection is left open this is probably not nearly as complicated as the current code"

	<example>
	| service connection sema x |
	[ 
	sema := Semaphore new.
	self closeConnection.
	[ 
	connection := self connection.
	service := connection serviceFor: #SpkScaffoldingService.
	x := service gsDebugger_04: '7 foo'.
	sema signal ] forkNamed:
		'Sparkle Scaffolding - keep connection alive until timeout'.
	x inspect.
	sema wait.
	self halt ] ensure: [ connection close ]
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
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	^Connection := initiator connect
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

	^ (remoteSelf gsDebugger_04: aString) wait
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
