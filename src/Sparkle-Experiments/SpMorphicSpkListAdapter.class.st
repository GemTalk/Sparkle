Class {
	#name : 'SpMorphicSpkListAdapter',
	#superclass : 'SpMorphicListAdapter',
	#category : 'Sparkle-Experiments'
}

{ #category : 'factory' }
SpMorphicSpkListAdapter >> buildWidget [
	super buildWidget.
	"Ugly hack since it's not easily pluggable."
	SpkTableMorph adoptInstance: widget.
	widget setMultipleSelection: self model isMultipleSelection.
	^ widget
]
