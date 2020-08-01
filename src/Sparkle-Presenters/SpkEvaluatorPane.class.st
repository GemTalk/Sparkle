"
I am a concrete class.

My purpose is to display and handle a code snippet that is (hopefull) executable, but is not a method in that it doesn't have a message pattern like a full method would.
"
Class {
	#name : 'SpkEvaluatorPane',
	#superclass : 'SpkCodePane',
	#category : 'Sparkle-Presenters'
}

{ #category : 'initialization' }
SpkEvaluatorPane >> initializePresenters [
	super initializePresenters.
	codePresenter placeholder:
		'Enter code here and accept to evaluate it and inspect the result.'.
	paneLabel label: 'Evaluator'
]

{ #category : 'layout' }
SpkEvaluatorPane >> paneLabel [
	^ self newLabel
		  label: 'Evaluator';
		  yourself
]
