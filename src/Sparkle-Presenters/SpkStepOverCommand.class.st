Class {
	#name : 'SpkStepOverCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkStepOverCommand class >> defaultDescription [

	^'Step over the highlighted message send'
]

{ #category : 'defaults' }
SpkStepOverCommand class >> defaultIconName [

	^ #stepOver28
]

{ #category : 'defaults' }
SpkStepOverCommand class >> defaultName [

	^ 'Step over'
]

{ #category : 'executing' }
SpkStepOverCommand >> execute [

	self context stepOver
]
