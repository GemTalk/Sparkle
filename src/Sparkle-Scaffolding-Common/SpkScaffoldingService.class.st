Class {
	#name : 'SpkScaffoldingService',
	#superclass : 'RsrService',
	#instVars : [
		'doitResult',
		'debugService',
		'doitStack',
		'processList'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingService class >> scaffoldingConnectionServiceLoop: listenForDebugConnection [
	"start listening on the scaffolding host/port and wait for a connection, 
		when connection is made wait for connection to close and start 
		another waiting for a new connection.

	if <listenForDebugConnection> is true, start listening service, to allow 
		remote debugging.
	"

	"currently expected to be run in a topaz session, when using 
		<listenForDebugConnection> use
			IFERR 2 TOPAZWAITFORDEBUG
	"

	| host port acceptor connection |
	listenForDebugConnection
		ifTrue: [ System listenForDebugConnection ].
	host := '127.0.0.1'.
	port := 47652.
	acceptor := RsrAcceptConnection host: host port: port.
	GsProcess _current name: 'Scaffolding service loop'.
	[ 
	GsFile gciLogServer: 'waiting for connection'.
	connection := acceptor waitForConnection.
	System abort.	"update view"
	true ]
		whileTrue: [ 
			GsFile gciLogServer: 'got a connection'.
			connection waitUntilClose ]
]

{ #category : 'accessing' }
SpkScaffoldingService class >> templateClassName [

	^ #SpkScaffoldingService
]

{ #category : 'doits' }
SpkScaffoldingService >> doit_01: aString [

	self subclassResponsibility
]

{ #category : 'doits' }
SpkScaffoldingService >> doit_02: aString [

	self subclassResponsibility
]

{ #category : 'debugger' }
SpkScaffoldingService >> doit_03: aString [

	self subclassResponsibility
]

{ #category : 'debugger' }
SpkScaffoldingService >> doit_04: aString [

	self subclassResponsibility
]

{ #category : 'debugger' }
SpkScaffoldingService >> doit_05: aString [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkScaffoldingService >> doitStack [
	^doitStack
]

{ #category : 'accessing' }
SpkScaffoldingService >> doitStack: object [
	doitStack := object
]

{ #category : 'accessing' }
SpkScaffoldingService >> processList [
	^ processList ifNil: [ processList := Dictionary new ]
]

{ #category : 'accessing' }
SpkScaffoldingService >> processList: aDictionary [
	"keys are process oop and value is the process stack ... yes I'm using a sledgehammer"

	processList := aDictionary
]
