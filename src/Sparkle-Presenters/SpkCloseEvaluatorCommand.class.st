Class {
	#name : 'SpkCloseEvaluatorCommand',
	#superclass : 'SpkCloseCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'default' }
SpkCloseEvaluatorCommand class >> defaultDescription [
	^ 'Close this evaluator and remove it from the inspector pane'
]

{ #category : 'default' }
SpkCloseEvaluatorCommand class >> defaultName [

	^ 'Close evaluator'
]
