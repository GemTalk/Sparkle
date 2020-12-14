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

{ #category : 'running' }
SpkClientScaffoldingInteractiveTest >> setUp [

	| host port initiator |
	super setUp.
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	connection := initiator connect.
	service := connection serviceFor: #SpkScaffoldingService
]

{ #category : 'running' }
SpkClientScaffoldingInteractiveTest >> tearDown [ 
	connection ifNotNil: [ connection close] .
			super tearDown.

]

{ #category : 'tests - debugger' }
SpkClientScaffoldingInteractiveTest >> testGsDebugger_01 [

	"
	Simulate a doit initiated in Pharo and executed in GemStone that results in a MNU
		for doit_03:, when an error is encountered on the server, a message is sent to the
		client from the server to bring up inspector on 7.
	This is a prelude to bringing up a debugger tool on the cient.
	"

	service doit_03: '7 foo'
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

	service doit_04: '7 foo'
]

{ #category : 'tests - doits' }
SpkClientScaffoldingInteractiveTest >> testGsDoit_01 [

	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"
	
	"https://github.com/GemTalk/RemoteServiceReplication/issues/66"

	service doit_01: '3+4' "promise broken with value `7` ... not supposed to return objects"
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
