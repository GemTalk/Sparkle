Class {
	#name : 'SpkConnectionPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionProfile'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkConnectionPresenter class >> connectionProfileClass [

	^self subclassResponsibility 
]

{ #category : 'accessing' }
SpkConnectionPresenter >> connectionProfile [

	^ connectionProfile
]

{ #category : 'accessing' }
SpkConnectionPresenter >> connectionProfile: anObject [

	connectionProfile := anObject
]
