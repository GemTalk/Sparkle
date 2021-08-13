Class {
	#name : 'SpkAcceptChangesCommand',
	#superclass : 'SpAcceptChangesCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkAcceptChangesCommand class >> defaultDescription [

	^'Inspect result of evaluator''s full text'
]

{ #category : 'default' }
SpkAcceptChangesCommand class >> defaultShortcutKey [

	^ $s command mac 
		| $s control win 
		| $s control unix
]

{ #category : 'execution' }
SpkAcceptChangesCommand >> execute [

	self context accept
]
