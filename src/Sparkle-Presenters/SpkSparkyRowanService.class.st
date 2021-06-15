"
An interface to the rowan service returned from the server as an array of arrays
"
Class {
	#name : 'SpkSparkyRowanService',
	#superclass : 'Object',
	#instVars : [
		'arrays'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'aspects' }
SpkSparkyRowanService class >> aspect [

	self subclassResponsibility 
]

{ #category : 'aspects' }
SpkSparkyRowanService class >> aspectFor: symbol [

	^self subclasses detect:[:ea | ea aspect = symbol]
]

{ #category : 'instance creation' }
SpkSparkyRowanService class >> fromArrays: arrays [
	"arrays is a collection of arrays representing a single service"
	| inst |
	inst := self new.
	inst arrays: arrays.
	^inst
]

{ #category : 'printing' }
SpkSparkyRowanService class >> printOn: stream [

	super printOn: stream.
	stream
		space; 
		nextPutAll: name 
]

{ #category : 'instance creation' }
SpkSparkyRowanService class >> servicesFromArrays: arrays [

	"array of array of arrays. Convert to something useful"

	^ arrays collect: [ :serviceArray | self fromArrays: serviceArray ]
]

{ #category : 'accessing' }
SpkSparkyRowanService >> arrays [

	^ arrays
]

{ #category : 'accessing' }
SpkSparkyRowanService >> arrays: anObject [

	arrays := anObject
]

{ #category : 'accessing' }
SpkSparkyRowanService >> aspectFor: symbol [

	"for now do not use the ifNone: variant.
	In theory, we should never ask for state of an inst var not in the service"

	| aspectArray |
	aspectArray := arrays detect: [ :array | array first == symbol ].
	^ aspectArray last
]

{ #category : 'testing' }
SpkSparkyRowanService >> isSparkyService [

	^true
]

{ #category : 'accessing' }
SpkSparkyRowanService >> name [
	^self aspectFor: #name
]

{ #category : 'updating' }
SpkSparkyRowanService >> updateFrom: sparkyRowanService [

	"I'm just a collection of static arrays with basic data types. 
	It's ok to replace my innards as they shouldn't be elsewhere."

	1 to: arrays size do: [ :index | 
		arrays at: index put: (sparkyRowanService arrays at: index) ]
]
