Class {
	#name : 'SpkDirectConnectionProfile',
	#superclass : 'SpkConnectionProfile',
	#instVars : [
		'port',
		'inMemory'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'actions' }
SpkDirectConnectionProfile >> connect [

	| connectionSpec connection |
	connectionSpec := inMemory
		                  ifTrue: [ RsrInMemoryConnectionSpecification new ]
		                  ifFalse: [ 
		                  RsrInitiateConnection
			                  host: host
			                  port: port asInteger ].
	connection := connectionSpec connect.
	self initializeTaskspaceForConnection: connection
]

{ #category : 'constants' }
SpkDirectConnectionProfile >> defaultPort [

	^ '29299'
]

{ #category : 'displaying' }
SpkDirectConnectionProfile >> displayString [

	| displayString |
	displayString := super displayString.
	^ String streamContents: [ :stream | 
		  displayString putOn: stream.
		  stream
			  space;
			  nextPutAll: '@';
			  nextPutAll: port;
			  space.
		  inMemory ifTrue: [ stream nextPutAll: '(in memory)' ].
		  stream ]
]

{ #category : 'accessing' }
SpkDirectConnectionProfile >> inMemory [

	^ inMemory
]

{ #category : 'accessing' }
SpkDirectConnectionProfile >> inMemory: anObject [

	inMemory := anObject
]

{ #category : 'initialization' }
SpkDirectConnectionProfile >> initialize [

	super initialize.
	port := self defaultPort.
	inMemory := false
]

{ #category : 'testing' }
SpkDirectConnectionProfile >> isInsecureProfile [

	^true
]

{ #category : 'accessing' }
SpkDirectConnectionProfile >> port [

	^ port
]

{ #category : 'accessing' }
SpkDirectConnectionProfile >> port: anObject [

	port := anObject
]

{ #category : 'accessing' }
SpkDirectConnectionProfile >> type [ 
	^'Direct'
]
