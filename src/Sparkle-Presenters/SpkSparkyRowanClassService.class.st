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
SpkSparkyRowanClassService >> packageName [
	^self aspectFor: #packageName
]

{ #category : 'accessing' }
SpkSparkyRowanClassService >> projectName [
	^self aspectFor: #projectName
]

{ #category : 'accessing' }
SpkSparkyRowanClassService >> template [
	^self aspectFor: #template
]
