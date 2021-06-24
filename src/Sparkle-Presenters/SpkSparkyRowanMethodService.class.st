Class {
	#name : 'SpkSparkyRowanMethodService',
	#superclass : 'SpkSparkyRowanService',
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'aspects' }
SpkSparkyRowanMethodService class >> aspect [

	^ #methods
]

{ #category : 'accessing' }
SpkSparkyRowanMethodService >> name [
	^self aspectFor: #selector
]
