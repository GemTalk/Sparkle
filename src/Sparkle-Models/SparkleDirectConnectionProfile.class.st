Class {
	#name : 'SparkleDirectConnectionProfile',
	#superclass : 'SparkleConnectionProfile',
	#instVars : [
		'port',
		'inMemory'
	],
	#category : 'Sparkle-Models'
}

{ #category : 'actions' }
SparkleDirectConnectionProfile >> connect [

	| connectionThing |
	connectionThing := inMemory
		                   ifTrue: [ RsrInMemoryConnectionSpecification new ]
		                   ifFalse: [ 
		                   RsrInitiateConnection
			                   host: host
			                   port: port asInteger ].
	connection := connectionThing connect.
	ProfileAnnouncer announce:
		(SpkConnectionProfileConnectedAnnouncement new profiles:
			 (Array with: self)).
	^ connection
]

{ #category : 'constants' }
SparkleDirectConnectionProfile >> defaultPort [

	^ '29299'
]

{ #category : 'displaying' }
SparkleDirectConnectionProfile >> displayString [

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
SparkleDirectConnectionProfile >> inMemory [

	^ inMemory
]

{ #category : 'accessing' }
SparkleDirectConnectionProfile >> inMemory: anObject [

	inMemory := anObject
]

{ #category : 'initialization' }
SparkleDirectConnectionProfile >> initialize [

	super initialize.
	port := self defaultPort.
	inMemory := false
]

{ #category : 'testing' }
SparkleDirectConnectionProfile >> isInsecureProfile [

	^true
]

{ #category : 'accessing' }
SparkleDirectConnectionProfile >> port [

	^ port
]

{ #category : 'accessing' }
SparkleDirectConnectionProfile >> port: anObject [

	port := anObject
]

{ #category : 'accessing' }
SparkleDirectConnectionProfile >> type [ 
	^'Insecure'
]
