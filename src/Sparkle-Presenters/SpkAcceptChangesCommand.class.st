Class {
	#name : 'SpkAcceptChangesCommand',
	#superclass : 'SpAcceptChangesCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkAcceptChangesCommand class >> defaultDescription [

	^'Inspect result of evaluator''s full text'
]

{ #category : 'execution' }
SpkAcceptChangesCommand >> execute [

	self context accept
]
