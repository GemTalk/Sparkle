Class {
	#name : 'SpkCommitTransactionCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkCommitTransactionCommand class >> defaultName [

	^ 'Commit Transaction'
]

{ #category : 'executing' }
SpkCommitTransactionCommand >> execute [

	self context commitTransaction
]
