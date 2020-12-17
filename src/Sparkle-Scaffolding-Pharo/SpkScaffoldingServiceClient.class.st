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

{ #category : 'connections' }
SpkScaffoldingServiceClient class >> connection [

	(Connection isNil or: [Connection isOpen not ]) ifTrue: [ self initiateConnection ].
	^Connection
]

{ #category : 'connections' }
SpkScaffoldingServiceClient class >> initiateConnection [

	| host port initiator |
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	^Connection := initiator connect
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
