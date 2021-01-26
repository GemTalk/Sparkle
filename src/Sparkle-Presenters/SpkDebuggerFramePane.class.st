Class {
	#name : 'SpkDebuggerFramePane',
	#superclass : 'SpkPane',
	#instVars : [
		'sourcePresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkDebuggerFramePane >> addSourcePositionDecoration [

	sourcePresenter
		removeAllTextSegmentDecorations;
		addTextSegmentDecoration: (SpTextPresenterDecorator new
				 highlightColor: (Color orange alpha: 0.5);
				 underlineColor: Color transparent;
				 interval: model currentSourceInterval;
				 yourself)
]

{ #category : 'tests - header' }
SpkDebuggerFramePane >> headerClass [

	^ SpkDebuggerFramePaneHeader
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializePresenters [

	super initializePresenters.
	sourcePresenter := self newCode
		                   beNotEditable;
		                   text: self sourceText;
		                   yourself.
	self layout add: sourcePresenter.

	"Decoration cannot be added until the code adapter is built."
	self defer: [ self addSourcePositionDecoration ]
]

{ #category : 'printing' }
SpkDebuggerFramePane >> sourceText [

	^ model source
]
