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
	#classVars : [
		'DefaultPath'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'accessing' }
SpkGCIConnectionProfile class >> defaultPath [

	^DefaultPath
]

{ #category : 'accessing' }
SpkGCIConnectionProfile class >> defaultPath: string [

	DefaultPath := string
]

{ #category : 'initialization' }
SpkGCIConnectionProfile class >> initialize [

	DefaultPath := String new
]

{ #category : 'actions' }
SpkGCIConnectionProfile >> connect [

	| connection |
	"initialize gci library"
	GciInterface libraryDirectory: path.
	session := GsSession
		           newForGsVersion: version
		           threadSafe: true
		           stone: stone
		           host: host
		           netldi: netldi.
	session loginWithGsUser: user password: password. "need to analyze result b4 proceeding"
	connection := self setupRSRConnection.
	self initializeTaskspaceForConnection: connection
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
	threadSafe := true. "always true for now"
	path := self class defaultPath.
	user := String new.
	password := String new
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

{ #category : 'accessing' }
SpkGCIConnectionProfile >> password [

	^ password
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> password: anObject [

	password := anObject
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> path [

	^ path
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> path: anObject [

	path := anObject
]

{ #category : 'actions' }
SpkGCIConnectionProfile >> setupRSRConnection [

	"Make and answer an RSR connection"

	| detailBytes initiator thePort token |
	detailBytes := session
		               executeStringAndFetchResultByteArray:
			               '| acceptor port detailBytes |
		acceptor := RsrAcceptConnection port: RsrAcceptConnection wildcardPort.
		acceptor ensureListening.
		SessionTemps current
			at: #PendingConnectionAcceptor
			put: acceptor.
		port := acceptor listeningPort.
		detailBytes := ByteArray new: 18.
		detailBytes unsigned16At: 1 put: port.
		detailBytes
			replaceFrom: 3
			to: 18
			with: acceptor token bytes.
		detailBytes'
		               maxResultSize: 1024.
	session executeStringNb: '| connection |
		connection := (SessionTemps current at: #PendingConnectionAcceptor) waitForConnection.
		SessionTemps current removeKey: #PendingConnectionAcceptor.
		connection waitUntilClose.'.
	thePort := detailBytes unsignedShortAt: 1 bigEndian: true.
	token := RsrToken bytes: (detailBytes copyFrom: 3 to: 18).
	initiator := RsrInitiateConnection host: host port: thePort token: token.
	^ initiator connect
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
SpkGCIConnectionProfile >> user [

	^ user
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> user: anObject [

	user := anObject
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> version [

	^ version
]

{ #category : 'accessing' }
SpkGCIConnectionProfile >> version: anObject [

	version := anObject
]
