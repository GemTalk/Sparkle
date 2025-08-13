Class {
	#name : 'SpkBeginTransactionCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkBeginTransactionCommand class >> defaultName [

	^ 'Begin Transaction'
]

{ #category : 'executing' }
SpkBeginTransactionCommand >> execute [

	self context beginTransaction
]
