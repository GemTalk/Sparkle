Class {
	#name : 'SpMorphicSpkTableAdapter',
	#superclass : 'SpMorphicTableAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkTableAdapter >> buildWidget [

	super buildWidget.
	"Ugly hack since it's not easily pluggable."
	SpkTableMorph adoptInstance: widget.
	widget setMultipleSelection: self model isMultipleSelection.
	^ widget
]
