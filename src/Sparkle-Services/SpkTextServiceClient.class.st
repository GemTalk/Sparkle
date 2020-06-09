Class {
	#name : #SpkTextServiceClient,
	#superclass : #SpkTextService,
	#instVars : [
		'dependents',
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

{ #category : #dependencies }
SpkTextServiceClient >> addDependent: aPresenter [
	dependents add: aPresenter
]

{ #category : #updating }
SpkTextServiceClient >> changed [
	dependents do: [ :each | each updateFromModel ]
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

{ #category : #dependencies }
SpkTextServiceClient >> myDependents [
	^ dependents
]

{ #category : #events }
SpkTextServiceClient >> remoteWindowIsClosing [
	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	dependents do: [ :each | each closeWindow ]
]

{ #category : #dependencies }
SpkTextServiceClient >> removeDependent: aPresenter [
	dependents remove: aPresenter
]
