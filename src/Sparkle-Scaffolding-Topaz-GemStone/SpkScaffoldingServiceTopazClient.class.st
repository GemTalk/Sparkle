"
Pretty much copied from SpkScaffoldingServiceClient on Pharo
"
Class {
	#name : 'SpkScaffoldingServiceTopazClient',
	#superclass : 'SpkScaffoldingService',
	#classVars : [
		'Connection'
	],
	#category : 'Sparkle-Scaffolding-Topaz-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingServiceTopazClient class >> clientClassName [
	^ #'SpkScaffoldingServiceTopazClient'
]

{ #category : 'connections' }
SpkScaffoldingServiceTopazClient class >> closeConnection [

	(Connection notNil and: [ Connection isOpen ]) ifTrue: [ 
		Connection close ]
]

{ #category : 'connections' }
SpkScaffoldingServiceTopazClient class >> connection [

	(Connection isNil or: [ Connection isOpen not ]) ifTrue: [ 
		self initiateConnection ].
	^ Connection
]

{ #category : 'examples' }
SpkScaffoldingServiceTopazClient class >> debugger_05: listenForDebugConnection [
	"open inspector on the SpkScaffoldingTopazService that will have a 
		SpkScaffoldingProcessService instance with the debugProcess 
		and stack frames (wrapping rownan process service and frame 
		services)"

	| service |
	listenForDebugConnection
		ifTrue: [ System listenForDebugConnection ].
self halt.
	service := (Rowan globalNamed: self clientClassName) new
		registerWith: self connection;
		yourself.
	(service gsDebugger_04: '7 halt')
		when: [ :result | GsFile gciLogServer: 'when -> ' , result prinString ]
		catch: [ :reason | GsFile gciLogServer: 'catch - >' , reason printString ].
	(Delay forSeconds: 5) wait
]

{ #category : 'connections' }
SpkScaffoldingServiceTopazClient class >> initiateConnection [

	| host port initiator |
	host := '127.0.0.1'.
	port := self port.
	initiator := RsrInitiateConnection host: host port: port.
	^ Connection := initiator connect
]

{ #category : 'connections' }
SpkScaffoldingServiceTopazClient class >> port [
	^ 7653
]

{ #category : 'accessing' }
SpkScaffoldingServiceTopazClient class >> serverClassName [
	^ #'SpkScaffoldingServiceTopazServer'
]

{ #category : 'accessing' }
SpkScaffoldingServiceTopazClient >> doitExceptionDescription [

	^ remoteSelf doitExceptionDescription wait
]

{ #category : 'accessing' }
SpkScaffoldingServiceTopazClient >> doitResult [

	^ remoteSelf doitResult wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceTopazClient >> gsDebugger_04: aString [

	^ remoteSelf gsDebugger_04: aString
]

{ #category : 'debugger' }
SpkScaffoldingServiceTopazClient >> openDebuggerOnClient [
	| x |
	x := self doitStack.
	x halt.
]
