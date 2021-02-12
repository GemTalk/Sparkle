"
A SparkleConnectionProfile contains all the information necessary to establish an in-memory or exteral RSR connection. 

	name:	user-generated name 
	host:	name of remote server host
	port:	name of remote server port
	group: optional field useful to categorize collections of profiles
	inMemory: use an in memory connection. Ignores host and port. 

	Profiles:  Collection of active profiles used by all Sparkle Launchers
"
Class {
	#name : 'SpkConnectionProfile',
	#superclass : 'Object',
	#instVars : [
		'name',
		'host',
		'group',
		'connection',
		'port'
	],
	#classVars : [
		'ProfileAnnouncer',
		'Profiles'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'accessing' }
SpkConnectionProfile class >> addProfile: connectionProfile [

	(self connectionProfileExists: connectionProfile) ifTrue: [ 
		self inform: 'Cannot add duplicate named profile'. ^false ].
	self profiles add: connectionProfile.
	ProfileAnnouncer announce:
		(SpkConnectionProfileAddedAnnouncement new profiles:
			 (Array with: connectionProfile)).
	^true
]

{ #category : 'testing' }
SpkConnectionProfile class >> connectionProfileExists: connectionProfile [

	^ self profiles includes: connectionProfile
]

{ #category : 'accessing' }
SpkConnectionProfile class >> initializeProfiles [
	"self initializeProfiles"
	Profiles := OrderedCollection new
]

{ #category : 'class initialization' }
SpkConnectionProfile class >> profileAnnouncer [

	^ ProfileAnnouncer ifNil: [ ProfileAnnouncer := Announcer new ]
]

{ #category : 'accessing' }
SpkConnectionProfile class >> profileChanged: connectionProfile [

	ProfileAnnouncer announce:
		(SpkConnectionProfileChangedAnnouncement new profiles:
			 (Array with: connectionProfile))
]

{ #category : 'accessing' }
SpkConnectionProfile class >> profiles [

	^ Profiles ifNil: [ 
		  self initializeProfiles.
		  Profiles ]
]

{ #category : 'accessing' }
SpkConnectionProfile class >> profiles: collection [

	^ Profiles := collection 
]

{ #category : 'profiles' }
SpkConnectionProfile class >> removeProfiles: connectionProfiles [

	Profiles removeAll: connectionProfiles.
	ProfileAnnouncer announce:
		(SpkConnectionProfileRemovedAnnouncement new profiles:
			 connectionProfiles)
]

{ #category : 'comparing' }
SpkConnectionProfile >> = connectionProfile [

	^ name = connectionProfile name
]

{ #category : 'accessing' }
SpkConnectionProfile >> connection [

	^ connection
]

{ #category : 'accessing' }
SpkConnectionProfile >> connection: anObject [

	connection := anObject
]

{ #category : 'constants' }
SpkConnectionProfile >> defaultPort [

	^ '29299'
]

{ #category : 'actions' }
SpkConnectionProfile >> disconnect [

	connection ifNotNil: [ :conn | 
		conn close.
		connection := nil.
		ProfileAnnouncer announce:
			(SpkConnectionProfileDisconnectedAnnouncement new profiles:
				 (Array with: self)) ]
]

{ #category : 'displaying' }
SpkConnectionProfile >> displayString [

	^ String streamContents: [ :stream | 
		  stream
			  nextPutAll: self type;
			  nextPutAll: ' - ';
			  nextPutAll: host.
		  stream ]
]

{ #category : 'accessing' }
SpkConnectionProfile >> group [

	^ group
]

{ #category : 'accessing' }
SpkConnectionProfile >> group: anObject [

	group := anObject
]

{ #category : 'comparing' }
SpkConnectionProfile >> hash [

	^ name identityHash
]

{ #category : 'accessing' }
SpkConnectionProfile >> host [

	^ host
]

{ #category : 'accessing' }
SpkConnectionProfile >> host: anObject [

	host := anObject
]

{ #category : 'initialization' }
SpkConnectionProfile >> initialize [

	super initialize.
	name := String new.
	host := String new.
	group := String new.
	port := self defaultPort.
	
]

{ #category : 'testing' }
SpkConnectionProfile >> isGciProfile [

	^false
]

{ #category : 'testing' }
SpkConnectionProfile >> isInsecureProfile [

	^false
]

{ #category : 'accessing' }
SpkConnectionProfile >> name [

	^ name
]

{ #category : 'accessing' }
SpkConnectionProfile >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SpkConnectionProfile >> port [

	^ port
]

{ #category : 'accessing' }
SpkConnectionProfile >> port: anObject [

	port := anObject
]

{ #category : 'accessing' }
SpkConnectionProfile >> type [

	self subclassResponsibility 
]
