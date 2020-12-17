"
This class contains tests that are expected to be run interactively, since nearly all of them will bring up and inspector
"
Class {
	#name : 'SpkClientScaffoldingInteractiveTest',
	#superclass : 'TestCase',
	#instVars : [
		'connection',
		'service'
	],
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'private' }
SpkClientScaffoldingInteractiveTest >> _usePrivateConnection [
^true 
]

{ #category : 'running' }
SpkClientScaffoldingInteractiveTest >> setUp [

	super setUp.
	self _usePrivateConnection
		ifTrue: [ 
			| host port initiator |
			super setUp.
			host := '127.0.0.1'.
			port := 47652.
			initiator := RsrInitiateConnection host: host port: port.
			connection := initiator connect ]
		ifFalse: [ connection := SpkScaffoldingServiceClient connection ].
	service := connection serviceFor: #SpkScaffoldingService
]

{ #category : 'running' }
SpkClientScaffoldingInteractiveTest >> tearDown [

	super tearDown.
	self _usePrivateConnection
		ifTrue: [ 
			
			connection close ]

]

{ #category : 'tests - debugger' }
SpkClientScaffoldingInteractiveTest >> testGsDebugger_01 [

	"
	Simulate a doit initiated in Pharo and executed in GemStone that results in a MNU
		for doit_03:, when an error is encountered on the server, a message is sent to the
		client from the server to bring up inspector on 7.
	This is a prelude to bringing up a debugger tool on the cient.
	"

	service gsDebugger_01: '7 foo'
]

{ #category : 'tests - debugger' }
SpkClientScaffoldingInteractiveTest >> testGsDebugger_02 [

	"
	Simulate a doit initiated in Pharo and executed in GemStone that results in a MNU
		for doit_04:.
	When an error is encountered on the server, an inspector is opened on the 
		printString of the stack.
	Another prelude to bringing up a debugger tool on the cient.
	"

	service gsDebugger_02: '7 foo'
]

{ #category : 'tests - debugger' }
SpkClientScaffoldingInteractiveTest >> testGsDebugger_03 [

	"same as testGsDebugger_04, but with annoying TestTookTooMuchTime exception ... use testGsDebugger_04"

	service gsDebugger_03: '7 foo'
]

{ #category : 'tests - debugger' }
SpkClientScaffoldingInteractiveTest >> testGsDebugger_04 [

	"the delay has to be long enough to let the server do it's thing and open an inspector on the stack"

	[ service gsDebugger_03: '7 foo' ] forkNamed:
		'Sparkle Scaffolding - keep connection alive until timeout'.
	(Delay forMilliseconds: 500) wait
]

{ #category : 'tests - debugger' }
SpkClientScaffoldingInteractiveTest >> testGsDebugger_05 [

	"open inspector on the SpkScaffoldingService that will have a 
		SpkScaffoldingProcessService instance with the debugProcess 
		and stack frames (wrapping rownan process service and frame 
		services)"

	| x |
	[ x := service gsDebugger_04: '7 foo' ] forkNamed:
		'Sparkle Scaffolding - keep connection alive until timeout'.
	self _usePrivateConnection ifFalse: [ ^ self ].
	(Delay forMilliseconds: 500) wait.
	self halt: 'closing debugger will close connection ... wait for inspector to pop up'
]

{ #category : 'tests - doits' }
SpkClientScaffoldingInteractiveTest >> testGsDoit_01 [

	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	(service doit_01: '3+4') inspect
]

{ #category : 'tests - doits' }
SpkClientScaffoldingInteractiveTest >> testGsDoit_02 [

	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	| x |
	x := (service doit_02: '3+4') doitResult.
	x inspect
]

{ #category : 'tests - process list' }
SpkClientScaffoldingInteractiveTest >> testProcessList_01 [

	"return dictionary of process stackes keyed by process oop for all scheduled processes in server"

	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	service processList inspect
]
