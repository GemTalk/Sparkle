Class {
	#name : #SpkTextService,
	#superclass : #RsrService,
	#instVars : [
		'string'
	],
	#category : #'Sparkle-Services'
}

{ #category : #'as yet unclassified' }
SpkTextService class >> serviceClassName [
	^ #SpkTextService
]

{ #category : #initialization }
SpkTextService >> initialize [ 

	string := ''
]

{ #category : #accessing }
SpkTextService >> string [
	^ string
]

{ #category : #accessing }
SpkTextService >> string: anObject [
	string = anObject
		ifFalse: [ string := anObject.
			remoteSelf changed ]
]
