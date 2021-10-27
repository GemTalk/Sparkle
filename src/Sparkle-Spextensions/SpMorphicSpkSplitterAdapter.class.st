Class {
	#name : 'SpMorphicSpkSplitterAdapter',
	#superclass : 'SpAbstractMorphicAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkSplitterAdapter >> buildWidget [

	| splitter |
	splitter := SpkSplitterMorph new.
	splitter
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap.
	^ splitter
]
