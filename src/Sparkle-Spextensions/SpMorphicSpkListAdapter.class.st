"
To find users of this class, browse references to #SpkListAdapter.
"
Class {
	#name : 'SpMorphicSpkListAdapter',
	#superclass : 'SpMorphicListAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkListAdapter >> buildWidget [
	super buildWidget.
	"Ugly hack since it's not easily pluggable."
	SpkTableMorph adoptInstance: widget.
	widget setMultipleSelection: self model isMultipleSelection.
	^ widget
]
