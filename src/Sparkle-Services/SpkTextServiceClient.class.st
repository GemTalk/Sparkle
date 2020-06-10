Class {
	#name : #SpkTextServiceClient,
	#superclass : #SpkTextService,
	#traits : 'SpkTDependents',
	#classTraits : 'SpkTDependents classTrait',
	#instVars : [
		'dependents',
		'myDependents',
		'isClosing'
	],
	#category : #'Sparkle-Services'
}

{ #category : #'instance creation' }
SpkTextServiceClient class >> forConnection: aConnection [
	^ self new
		registerWith: aConnection;
		yourself
]

{ #category : #updating }
SpkTextServiceClient >> close [
	remoteSelf closeDependents
]

{ #category : #updating }
SpkTextServiceClient >> closeDependents [
	dependents do: [ :each | each modelClosing ]
]

{ #category : #initialization }
SpkTextServiceClient >> initialize [
	super initialize.
	dependents := IdentitySet new.
	isClosing := false
]

{ #category : #events }
SpkTextServiceClient >> localWindowIsClosing [
	"Either side may close the window."

	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	remoteSelf remoteWindowIsClosing.
	self _connection close
]

{ #category : #accessing }
SpkTextServiceClient >> myDependents [
	^ myDependents
]

{ #category : #accessing }
SpkTextServiceClient >> myDependents: anObject [
	myDependents := anObject
]

{ #category : #events }
SpkTextServiceClient >> remoteWindowIsClosing [
	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	dependents do: [ :each | each closeWindow ]
]
