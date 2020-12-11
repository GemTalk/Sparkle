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

{ #category : 'tests' }
SpkClientScaffoldingInteractiveTest >> testGsDoit [

	"simulate a doit initiated in Pharo and executed in GemStone ... 
	bring up a Pharo inspector on the client"

	{service doit: '3+4'} inspect
]
