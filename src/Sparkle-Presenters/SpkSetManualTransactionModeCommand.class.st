Class {
	#name : 'SpkSetManualTransactionModeCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkSetManualTransactionModeCommand class >> defaultName [

	^ 'Set Manual Transaction Mode'
]

{ #category : 'executing' }
SpkSetManualTransactionModeCommand >> execute [

	self context setManualTransactionMode
]
