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
SpkTextService >> newLocalString: anObject [
	"String modified locally. Change both here and remotely"

	self string: anObject.
	remoteSelf string: string
]

{ #category : #accessing }
SpkTextService >> string [
	^ string
]

{ #category : #accessing }
SpkTextService >> string: anObject [
	string := anObject asString.
	self changed
]

{ #category : #'as yet unclassified' }
SpkTextService >> updateDependents [
	self subclassResponsibility
]
