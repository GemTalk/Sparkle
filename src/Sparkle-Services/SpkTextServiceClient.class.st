Class {
	#name : #SpkTextServiceClient,
	#superclass : #SpkTextService,
	#instVars : [
		'subscriptions'
	],
	#category : #'Sparkle-Services'
}

{ #category : #adding }
SpkTextServiceClient >> addSubscriber: aPresenter [
	subscriptions add: aPresenter
]

{ #category : #updating }
SpkTextServiceClient >> changed [
	subscriptions do: [ :each | each updateFromModel ]
]

{ #category : #initialization }
SpkTextServiceClient >> initialize [
	super initialize.
	subscriptions := IdentitySet new
]

{ #category : #adding }
SpkTextServiceClient >> removeSubscriber: aPresenter [
	subscriptions remove: aPresenter
]

{ #category : #accessing }
SpkTextServiceClient >> string: aString [
	super string: aString.
	self changed
]
