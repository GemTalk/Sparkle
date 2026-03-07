Class {
	#name : 'SpkDirectConnectionProfileB',
	#superclass : 'SpkConnectionProfile',
	#instVars : [
		'port',
		'inMemory'
	],
	#category : 'Sparkle-Presenters-Support',
	#package : 'Sparkle-Presenters',
	#tag : 'Support'
}

{ #category : 'actions' }
SpkDirectConnectionProfileB >> connect [

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
SpkDirectConnectionProfileB >> defaultPort [

	^ '29299'
]

{ #category : 'displaying' }
SpkDirectConnectionProfileB >> displayString [

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
SpkDirectConnectionProfileB >> inMemory [

	^ inMemory
]

{ #category : 'accessing' }
SpkDirectConnectionProfileB >> inMemory: anObject [

	inMemory := anObject
]

{ #category : 'initialization' }
SpkDirectConnectionProfileB >> initialize [

	super initialize.
	port := self defaultPort.
	inMemory := false
]

{ #category : 'accessing' }
SpkDirectConnectionProfileB >> initializeTaskspaceForConnection: anRSRConnection [

	taskspace := SpkTaskspaceB forConnection: anRSRConnection.
	ProfileAnnouncer announce:
		(SpkConnectionProfileConnectedAnnouncement new profiles:
			 (Array with: self))
]

{ #category : 'testing' }
SpkDirectConnectionProfileB >> isInsecureProfile [

	^true
]

{ #category : 'accessing' }
SpkDirectConnectionProfileB >> port [

	^ port
]

{ #category : 'accessing' }
SpkDirectConnectionProfileB >> port: anObject [

	port := anObject
]

{ #category : 'accessing' }
SpkDirectConnectionProfileB >> type [ 
	^'Direct'
]
