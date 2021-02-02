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
	#name : 'SparkleConnectionProfile',
	#superclass : 'Object',
	#instVars : [
		'name',
		'host',
		'port',
		'inMemory',
		'group',
		'connection'
	],
	#classVars : [
		'ProfileAnnouncer',
		'Profiles'
	],
	#category : 'Sparkle-Models'
}

{ #category : 'accessing' }
SparkleConnectionProfile class >> addProfile: connectionProfile [

	(self connectionProfileExists: connectionProfile) ifTrue: [ 
		self inform: 'Cannot add duplicate named profile'. ^false ].
	self profiles add: connectionProfile.
	ProfileAnnouncer announce:
		(SpkConnectionProfileAddedAnnouncement new profiles:
			 (Array with: connectionProfile)).
	^true
]

{ #category : 'testing' }
SparkleConnectionProfile class >> connectionProfileExists: connectionProfile [

	^ self profiles includes: connectionProfile
]

{ #category : 'accessing' }
SparkleConnectionProfile class >> initializeProfiles [
	"self initializeProfiles"
	Profiles := OrderedCollection new
]

{ #category : 'class initialization' }
SparkleConnectionProfile class >> profileAnnouncer [

	^ ProfileAnnouncer ifNil: [ ProfileAnnouncer := Announcer new ]
]

{ #category : 'accessing' }
SparkleConnectionProfile class >> profileChanged: connectionProfile [

	ProfileAnnouncer announce:
		(SpkConnectionProfileChangedAnnouncement new profiles:
			 (Array with: connectionProfile))
]

{ #category : 'accessing' }
SparkleConnectionProfile class >> profiles [

	^ Profiles ifNil: [ self initializeProfiles ]
]

{ #category : 'profiles' }
SparkleConnectionProfile class >> removeProfiles: connectionProfiles [

	Profiles removeAll: connectionProfiles.
	ProfileAnnouncer announce:
		(SpkConnectionProfileRemovedAnnouncement new profiles:
			 connectionProfiles)
]

{ #category : 'comparing' }
SparkleConnectionProfile >> = connectionProfile [

	(self isKindOf: self class) ifFalse:[^false]. 
	^name = connectionProfile name
]

{ #category : 'accessing' }
SparkleConnectionProfile >> connection [

	^ connection
]

{ #category : 'accessing' }
SparkleConnectionProfile >> connection: anObject [

	connection := anObject
]

{ #category : 'accessing' }
SparkleConnectionProfile >> group [

	^ group
]

{ #category : 'accessing' }
SparkleConnectionProfile >> group: anObject [

	group := anObject
]

{ #category : 'comparing' }
SparkleConnectionProfile >> hash [

	^ name identityHash
]

{ #category : 'accessing' }
SparkleConnectionProfile >> host [

	^ host
]

{ #category : 'accessing' }
SparkleConnectionProfile >> host: anObject [

	host := anObject
]

{ #category : 'initialization' }
SparkleConnectionProfile >> initialize [

	super initialize.
	name := String new.
	group := String new. 
]

{ #category : 'accessing' }
SparkleConnectionProfile >> name [

	^ name
]

{ #category : 'accessing' }
SparkleConnectionProfile >> name: anObject [

	name := anObject
]
