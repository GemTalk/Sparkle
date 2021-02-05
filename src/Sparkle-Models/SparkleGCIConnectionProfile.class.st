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
	#name : 'SparkleGCIConnectionProfile',
	#superclass : 'SparkleConnectionProfile',
	#instVars : [
		'version',
		'threadSafe',
		'stone',
		'netldi'
	],
	#category : 'Sparkle-Models'
}

{ #category : 'displaying' }
SparkleGCIConnectionProfile >> displayString [

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
SparkleGCIConnectionProfile >> initialize [

	super initialize.
	version := String new.
	stone := String new. 
	netldi := String new.
	threadSafe := true "always true for now"
]

{ #category : 'testing' }
SparkleGCIConnectionProfile >> isGciProfile [

	^true
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> netldi [

	^ netldi
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> netldi: anObject [

	netldi := anObject
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> stone [

	^ stone
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> stone: anObject [

	stone := anObject
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> threadSafe [

	^ threadSafe
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> threadSafe: anObject [

	threadSafe := anObject
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> type [

	^'GCI'
	
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> version [

	^ version
]

{ #category : 'accessing' }
SparkleGCIConnectionProfile >> version: anObject [

	version := anObject
]
