Class {
	#name : 'SpkTextService',
	#superclass : 'RsrService',
	#instVars : [
		'string'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkTextService class >> templateClassName [
	^ #SpkTextService
]

{ #category : 'initialization' }
SpkTextService >> initialize [ 

	string := ''
]

{ #category : 'accessing' }
SpkTextService >> string [
	^ string
]

{ #category : 'accessing' }
SpkTextService >> string: anObject [
	string = anObject
		ifFalse: [ string := anObject.
			self updateRemote ]
]
