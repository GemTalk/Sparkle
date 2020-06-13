Class {
	#name : 'SpkTextServiceClient',
	#superclass : 'SpkTextService',
	#traits : 'SpkTDependents',
	#classTraits : 'SpkTDependents classTrait',
	#instVars : [
		'myDependents',
		'isClosing'
	],
	#category : 'Sparkle-Services-Pharo'
}

{ #category : 'instance creation' }
SpkTextServiceClient class >> forConnection: aConnection [
	^ self new
		registerWith: aConnection;
		yourself
]

{ #category : 'initialization' }
SpkTextServiceClient >> initialize [
	super initialize.
	isClosing := false
]

{ #category : 'events' }
SpkTextServiceClient >> localWindowIsClosing [
	"Either side may close the window."

	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	remoteSelf remoteWindowIsClosing.
	self _connection close
]

{ #category : 'accessing' }
SpkTextServiceClient >> myDependents [
	^ myDependents
]

{ #category : 'accessing' }
SpkTextServiceClient >> myDependents: anObject [
	myDependents := anObject
]

{ #category : 'events' }
SpkTextServiceClient >> remoteWindowIsClosing [
	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	self dependents do: [ :each | each closeWindow ]
]

{ #category : 'accessing' }
SpkTextServiceClient >> updateRemote [
	remoteSelf changed: #text
]
