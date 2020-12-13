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

	"simulate a doit initiated in Pharo and executed in GemStone that results in a MNU
		let's explore a bit
	"

	service doit_01: '7 foo' 
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
