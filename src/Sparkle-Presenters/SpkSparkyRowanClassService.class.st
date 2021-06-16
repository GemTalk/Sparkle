Class {
	#name : 'SpkSparkyRowanClassService',
	#superclass : 'SpkSparkyRowanService',
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'aspects' }
SpkSparkyRowanClassService class >> aspect [

	^ #classes
]

{ #category : 'accessing' }
SpkSparkyRowanClassService >> definition [
	^self aspectFor: #definition
]
