"
In order for the adornment (the orange triangle in the corner when there are unsaved changes)
to appera, I have to make autoAccept false.
"
Class {
	#name : 'SpMorphicSpkCodeAdapter',
	#superclass : 'SpMorphicTextAdapter',
	#category : 'Sparkle-Spextensions-Spec2'
}

{ #category : 'factory' }
SpMorphicSpkCodeAdapter >> buildWidget [

	| newWidget |
	newWidget := super buildWidget.
	"Ugly hack since it's not easily pluggable."
	SpkScrolledTextMorph adoptInstance: newWidget.

	^ newWidget
]
