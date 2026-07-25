Class {
	#name : 'SpkAcceptTonelChangesCommand',
	#superclass : 'SpAcceptChangesCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'default' }
SpkAcceptTonelChangesCommand class >> defaultDescription [

	^'Accept changes; write to file.'
]

{ #category : 'execution' }
SpkAcceptTonelChangesCommand >> execute [

	self context accept
]
