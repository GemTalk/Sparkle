Class {
	#name : 'SpkDirectConnectionProfile',
	#superclass : 'SpkConnectionProfile',
	#instVars : [
		'inMemory'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'actions' }
SpkDirectConnectionProfile >> connect [

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
	inMemory := false
]

{ #category : 'testing' }
SpkDirectConnectionProfile >> isInsecureProfile [

	^true
]

{ #category : 'accessing' }
SpkDirectConnectionProfile >> type [ 
	^'Direct'
]
