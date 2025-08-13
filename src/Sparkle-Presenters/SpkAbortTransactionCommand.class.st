Class {
	#name : 'SpkAbortTransactionCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkAbortTransactionCommand class >> defaultName [

	^ 'Abort Transaction'
]

{ #category : 'execution' }
SpkAbortTransactionCommand >> execute [

	self context abortTransaction
]
