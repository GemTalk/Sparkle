Class {
	#name : 'SpkStepThroughCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkStepThroughCommand class >> defaultDescription [

	^'Step through - either to the next message send in the frame or a related block'
]

{ #category : 'defaults' }
SpkStepThroughCommand class >> defaultIconName [

	^ #stepThrough16
]

{ #category : 'defaults' }
SpkStepThroughCommand class >> defaultName [

	^ 'Step through blocks'
]

{ #category : 'executing' }
SpkStepThroughCommand >> execute [

	self context stepThrough
]
