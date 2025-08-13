Class {
	#name : 'SpkStepIntoCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkStepIntoCommand class >> defaultDescription [

	^'Step into the highlighted message send'
]

{ #category : 'defaults' }
SpkStepIntoCommand class >> defaultIconName [

	^ #stepInto16
]

{ #category : 'defaults' }
SpkStepIntoCommand class >> defaultName [

	^ 'Step into'
]

{ #category : 'executing' }
SpkStepIntoCommand >> execute [

	self context stepInto
]
