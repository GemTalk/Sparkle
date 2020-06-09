Class {
	#name : #SpkTextService,
	#superclass : #RsrService,
	#instVars : [
		'string'
	],
	#category : #'Sparkle-Services'
}

{ #category : #accessing }
SpkTextService class >> templateClassName [
	^ #SpkTextService
]

{ #category : #initialization }
SpkTextService >> initialize [ 

	string := ''
]

{ #category : #events }
SpkTextService >> localWindowIsClosing [
	"Either side may close the window."

	remoteSelf remoteWindowIsClosing.
	self _connection close
]

{ #category : #events }
SpkTextService >> remoteWindowIsClosing [
	self subclassResponsibility
]

{ #category : #accessing }
SpkTextService >> string [
	^ string
]

{ #category : #accessing }
SpkTextService >> string: anObject [
	string = anObject
		ifFalse: [ string := anObject.
			self updateRemote ]
]

{ #category : #accessing }
SpkTextService >> updateRemote [
	remoteSelf changed
]
