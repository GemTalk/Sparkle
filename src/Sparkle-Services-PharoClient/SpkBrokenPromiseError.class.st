Class {
	#name : 'SpkBrokenPromiseError',
	#superclass : 'Error',
	#instVars : [
		'reason'
	],
	#category : 'Sparkle-Services-PharoClient-Support',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Support'
}

{ #category : 'accessing' }
SpkBrokenPromiseError >> reason [
	^ reason
]

{ #category : 'accessing' }
SpkBrokenPromiseError >> reason: anObject [
	reason := anObject
]
