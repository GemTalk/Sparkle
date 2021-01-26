Class {
	#name : 'SpkDebuggerFramePane',
	#superclass : 'SpkPane',
	#instVars : [
		'sourcePresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'tests - header' }
SpkDebuggerFramePane >> headerClass [

	^ SpkDebuggerFramePaneHeader
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializePresenters [

	super initializePresenters.
	sourcePresenter := self newText
		                 beNotEditable;
		                 text: self sourceText;
		                 yourself.
	self layout add: sourcePresenter
]

{ #category : 'printing' }
SpkDebuggerFramePane >> sourceText [

	^ model source
]
