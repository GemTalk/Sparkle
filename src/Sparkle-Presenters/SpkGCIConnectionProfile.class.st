"
A connection to a stone using a gci library

    Instance Variables
	netldi:		netldi name
	stone:		stone name
	threadSafe:		currently not exposed - always true for now
	version:		stone version string


    Implementation Points
"
Class {
	#name : 'SpkGCIConnectionProfile',
	#superclass : 'SpkConnectionProfile',
	#instVars : [
		'version',
		'threadSafe',
		'stone',
		'netldi',
		'user',
		'password',
		'path',
		'session'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'actions' }
SpkGCIConnectionProfile >> connect [

	"initialize gci library"

	GciInterface libraryDirectoryIsSet ifFalse: [ 
		GciInterface libraryDirectory:
			'/Users/eric/Documents/Pharo/images/ericDev1124/clientlibs' ].
	session := GsSession
		        newForGsVersion: version
		        threadSafe: true
		        stone: stone
		        host: host
		        netldi: netldi.
	session loginWithGsUser: 'SystemUser' password: 'swordfish'. "need to analyze result b4 proceeding"
	ProfileAnnouncer announce:
		(SpkConnectionProfileConnectedAnnouncement new profiles:
			 (Array with: self)).
	self setupRSRConnection. 
]

{ #category : 'actions' }
SpkGCIConnectionProfile >> disconnect [
	super disconnect.
	session logout.
	session := nil
]

{ #category : 'displaying' }
SpkGCIConnectionProfile >> displayString [

	| displayString |
	displayString := super displayString.
	^ String streamContents: [ :stream | 
		  displayString putOn: stream.
		  stream
			  space;
			  nextPutAll: version;
			  space;
			  nextPutAll: ' on ';
			  space;
			  nextPutAll: ' @ ';
			  nextPutAll: stone;
			  nextPutAll: netldi.
		  stream ]
]

{ #category : 'initialization' }
SpkGCIConnectionProfile >> initialize [

	super initialize.
	version := String new.
	stone := String new. 
	netldi := String new.
	threadSafe := true "always true for now"
]

{ #category : 'testing' }
SpkGCIConnectionProfile >> isGciProfile [

	^true
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> netldi [

	^ netldi
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> netldi: anObject [

	netldi := anObject
]

{ #category : 'actions' }
SpkGCIConnectionProfile >> setupRSRConnection [

	| initiator |
	session
		executeStringAndFetchResultByteArray:
		'| acceptor |
		acceptor := RsrAcceptConnection port: 29298.
		acceptor ensureListening.
		SessionTemps current
			at: #PendingConnectionAcceptor
			put: acceptor.
		ByteArray new: 80'
		maxResultSize: 1024.
	session executeStringNb:
		'| connection |
		connection := (SessionTemps current at: #PendingConnectionAcceptor) waitForConnection.
		SessionTemps current removeKey: #PendingConnectionAcceptor.
		connection waitUntilClose.'.
	initiator := RsrInitiateConnection host: host port: 29298.
	connection := initiator connect
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> stone [

	^ stone
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> stone: anObject [

	stone := anObject
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> threadSafe [

	^ threadSafe
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> threadSafe: anObject [

	threadSafe := anObject
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> type [

	^'GCI'
	
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> version [

	^ version
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> version: anObject [

	version := anObject
]
