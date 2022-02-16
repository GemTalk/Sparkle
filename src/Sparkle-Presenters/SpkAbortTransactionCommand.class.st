Class {
	#name : 'SpkAbortTransactionCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkAbortTransactionCommand class >> defaultName [

	^ 'Abort Transaction'
]

{ #category : 'execution' }
SpkAbortTransactionCommand >> execute [

	self context abortTransaction
]
