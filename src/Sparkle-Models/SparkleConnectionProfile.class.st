"
A SparkleConnectionProfile contains all the information necessary to establish an in-memory or exteral RSR connection. 

	host:	name of remote server host
	id:	 	connection ""number"" used by Sparkle to distinguish multiple connections to same server
	name:	user-generated name 
	port:	name of remote server port

	Profiles:  Collection of active profiles used by all Sparkle Launchers
"
Class {
	#name : 'SparkleConnectionProfile',
	#superclass : 'Object',
	#instVars : [
		'name',
		'host',
		'port',
		'id',
		'inMemory'
	],
	#classVars : [
		'ProfileAnnouncer',
		'Profiles'
	],
	#category : 'Sparkle-Models'
}

{ #category : 'accessing' }
SparkleConnectionProfile class >> addProfile: connectionProfile [

	self profiles add: connectionProfile.
	ProfileAnnouncer announce:
		(SpkConnectionProfileAddedAnnouncement new profile:
			 connectionProfile)
]

{ #category : 'class initialization' }
SparkleConnectionProfile class >> profileAnnouncer [

	^ ProfileAnnouncer ifNil: [ ProfileAnnouncer := Announcer new ]
]

{ #category : 'accessing' }
SparkleConnectionProfile class >> profiles [

	^ Profiles ifNil: [ Profiles := Set new ]
]

{ #category : 'profiles' }
SparkleConnectionProfile class >> removeProfile: aConnectionProfile [

	ProfileAnnouncer announce:
		(SpkConnectionProfileRemovedAnnouncement new profile:
			 aConnectionProfile)
]

{ #category : 'comparing' }
SparkleConnectionProfile >> = connectionProfile [

	(self isKindOf: self class) ifFalse:[^false]. 
	^name = connectionProfile name
]

{ #category : 'displaying' }
SparkleConnectionProfile >> displayStringOn: aStream [

	aStream
		nextPutAll: (name ifNil: [ '<no name>' ] ifNotNil: [ name ]);
		nextPutAll: ' - ';
		nextPutAll: (host ifNil: [ '<no host>' ] ifNotNil: [ host ]);
		nextPut: $:;
		nextPutAll: (port ifNil: [ '<no port>' ] ifNotNil: [ port ])
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

{ #category : 'accessing' }
SparkleConnectionProfile >> id [

	^ id
]

{ #category : 'accessing' }
SparkleConnectionProfile >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SparkleConnectionProfile >> inMemory [

	^ inMemory
]

{ #category : 'accessing' }
SparkleConnectionProfile >> inMemory: anObject [

	inMemory := anObject
]

{ #category : 'initialization' }
SparkleConnectionProfile >> initialize [

	super initialize.
	name := String new. 
	host := String new. 
	port := String new. 
	inMemory := false
]

{ #category : 'accessing' }
SparkleConnectionProfile >> name [

	^ name
]

{ #category : 'accessing' }
SparkleConnectionProfile >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SparkleConnectionProfile >> port [

	^ port
]

{ #category : 'accessing' }
SparkleConnectionProfile >> port: anObject [

	port := anObject
]
