Class {
	#name : 'SparkleInsecureConnectionProfile',
	#superclass : 'SparkleConnectionProfile',
	#category : 'Sparkle-Models'
}

{ #category : 'constants' }
SparkleInsecureConnectionProfile >> defaultPort [

	^ '29299'
]

{ #category : 'displaying' }
SparkleInsecureConnectionProfile >> displayStringOn: aStream [

	aStream
		nextPutAll: self class name;
		space;
		nextPutAll: (name ifNil: [ '<no name>' ] ifNotNil: [ name ]);
		nextPutAll: ' - ';
		nextPutAll: (host ifNil: [ '<no host>' ] ifNotNil: [ host ]);
		nextPut: $:;
		nextPutAll: (port ifNil: [ '<no port>' ] ifNotNil: [ port ]);
		nextPut: $:;
		nextPutAll: (group ifNil: [ '<no group>' ] ifNotNil: [ group ])
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
	name := String new.
	host := String new.
	port := self defaultPort.
	group := String new. 
	inMemory := false
]

{ #category : 'accessing' }
SparkleInsecureConnectionProfile >> port [

	^ port
]

{ #category : 'accessing' }
SparkleInsecureConnectionProfile >> port: anObject [

	port := anObject
]
