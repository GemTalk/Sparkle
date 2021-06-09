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

{ #category : 'instance creation' }
SpkSparkyRowanService class >> fromArrays: arrays [
	"arrays is a collection of arrays representing a single service"
	| inst |
	inst := self new.
	inst arrays: arrays.
	^inst
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

	"for now do not use the ifNone: variant. Eventually add it for a nicer error message"

	| aspectArray |
	aspectArray := arrays detect: [ :array | array first == symbol ].
	^ aspectArray last
]

{ #category : 'accessing' }
SpkSparkyRowanService >> name [
	"handy accessor"
	^self aspectFor: #name
]
