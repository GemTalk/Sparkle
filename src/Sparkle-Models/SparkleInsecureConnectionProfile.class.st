Class {
	#name : 'SparkleInsecureConnectionProfile',
	#superclass : 'SparkleConnectionProfile',
	#instVars : [
		'port',
		'inMemory'
	],
	#category : 'Sparkle-Models'
}

{ #category : 'actions' }
SparkleInsecureConnectionProfile >> connect [

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
SparkleInsecureConnectionProfile >> defaultPort [

	^ '29299'
]

{ #category : 'displaying' }
SparkleInsecureConnectionProfile >> displayString [

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
SparkleInsecureConnectionProfile >> inMemory [

	^ inMemory
]

{ #category : 'accessing' }
SparkleInsecureConnectionProfile >> inMemory: anObject [

	inMemory := anObject
]

{ #category : 'initialization' }
SparkleInsecureConnectionProfile >> initialize [

	super initialize.
	port := self defaultPort.
	inMemory := false
]

{ #category : 'testing' }
SparkleInsecureConnectionProfile >> isInsecureProfile [

	^true
]

{ #category : 'accessing' }
SparkleInsecureConnectionProfile >> port [

	^ port
]

{ #category : 'accessing' }
SparkleInsecureConnectionProfile >> port: anObject [

	port := anObject
]

{ #category : 'accessing' }
SparkleInsecureConnectionProfile >> type [ 
	^'Insecure'
]
