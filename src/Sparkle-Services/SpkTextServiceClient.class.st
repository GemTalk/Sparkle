Class {
	#name : #SpkTextServiceClient,
	#superclass : #SpkTextService,
	#instVars : [
		'dependents'
	],
	#category : #'Sparkle-Services'
}

{ #category : #adding }
SpkTextServiceClient >> addDependent: aPresenter [
	dependents add: aPresenter
]

{ #category : #updating }
SpkTextServiceClient >> changed [
	dependents do: [ :each | each updateFromModel ]
]

{ #category : #initialization }
SpkTextServiceClient >> initialize [
	super initialize.
	dependents := IdentitySet new
]

{ #category : #dependencies }
SpkTextServiceClient >> myDependents [
	^ dependents
]

{ #category : #adding }
SpkTextServiceClient >> removeDependent: aPresenter [
	dependents remove: aPresenter
]

{ #category : #accessing }
SpkTextServiceClient >> string: aString [
	super string: aString.
	self changed
]
