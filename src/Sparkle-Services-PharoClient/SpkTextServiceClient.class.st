Class {
	#name : 'SpkTextServiceClient',
	#superclass : 'SpkTextService',
	#traits : 'SpkTDependents',
	#classTraits : 'SpkTDependents classTrait',
	#instVars : [
		'myDependents',
		'isClosing'
	],
	#category : 'Sparkle-Services-PharoClient'
}

{ #category : 'instance creation' }
SpkTextServiceClient class >> forConnection: aConnection [
	^ self new
		registerWith: aConnection;
		yourself
]

{ #category : 'events' }
SpkTextServiceClient >> closeRequestedLocally [
	"Either side may close the window."

	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	remoteSelf closeRequestedRemotely.
	self _connection close
]

{ #category : 'events' }
SpkTextServiceClient >> closeRequestedRemotely [
	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	self dependents do: [ :each | each closeWindow ]
]

{ #category : 'initialization' }
SpkTextServiceClient >> initialize [
	super initialize.
	isClosing := false
]

{ #category : 'accessing' }
SpkTextServiceClient >> myDependents [
	^ myDependents
]

{ #category : 'accessing' }
SpkTextServiceClient >> myDependents: anObject [
	myDependents := anObject
]

{ #category : 'accessing' }
SpkTextServiceClient >> updateRemote [
	remoteSelf changed: #text
]
