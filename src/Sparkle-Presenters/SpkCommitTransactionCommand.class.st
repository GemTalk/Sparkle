Class {
	#name : 'SpkCommitTransactionCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkCommitTransactionCommand class >> defaultName [

	^ 'Commit Transaction'
]

{ #category : 'executing' }
SpkCommitTransactionCommand >> execute [

	self context commitTransaction
]
