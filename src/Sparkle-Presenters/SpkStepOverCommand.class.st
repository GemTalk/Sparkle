Class {
	#name : 'SpkStepOverCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkStepOverCommand class >> defaultDescription [

	^'Step over the highlighted message send'
]

{ #category : 'defaults' }
SpkStepOverCommand class >> defaultIconName [

	^ #stepOver16
]

{ #category : 'defaults' }
SpkStepOverCommand class >> defaultName [

	^ 'Step over'
]

{ #category : 'executing' }
SpkStepOverCommand >> execute [

	self context stepOver
]
