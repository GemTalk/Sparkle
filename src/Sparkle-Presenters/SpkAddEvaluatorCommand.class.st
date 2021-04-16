Class {
	#name : 'SpkAddEvaluatorCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkAddEvaluatorCommand class >> defaultDescription [
	^ 'Open an area for typing and evaluating code'
]

{ #category : 'defaults' }
SpkAddEvaluatorCommand class >> defaultIconName [

	^ #addEvaluator16
]

{ #category : 'default' }
SpkAddEvaluatorCommand class >> defaultName [

	^ 'Add Evaluator'
]

{ #category : 'executing' }
SpkAddEvaluatorCommand >> execute [

	self context addEvaluator
]
