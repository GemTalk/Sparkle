Class {
	#name : 'SpkSetAutomaticTransactionModeCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkSetAutomaticTransactionModeCommand class >> defaultName [

	^ 'Set Automatic Transaction Mode'
]

{ #category : 'executing' }
SpkSetAutomaticTransactionModeCommand >> execute [

	self context setAutomaticTransactionMode
]
