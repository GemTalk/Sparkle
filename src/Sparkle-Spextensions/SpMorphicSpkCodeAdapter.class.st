"
In order for the adornment (the orange triangle in the corner when there are unsaved changes)
to appear, I have to make autoAccept false.
"
Class {
	#name : 'SpMorphicSpkCodeAdapter',
	#superclass : 'SpMorphicTextAdapter',
	#category : 'Sparkle-Spextensions-Adapters',
	#package : 'Sparkle-Spextensions',
	#tag : 'Adapters'
}

{ #category : 'factory' }
SpMorphicSpkCodeAdapter >> buildWidget [

	| newWidget |
	newWidget := super buildWidget.
	"Ugly hack since it's not easily pluggable."
	SpkScrolledTextMorph adoptInstance: newWidget.
	"Enable the yellow corner when unsaved changes."
	newWidget withAdornment.
	^ newWidget
]

{ #category : 'spec protocol' }
SpMorphicSpkCodeAdapter >> hasUnacceptedEdits: aBoolean [

	self model hasUnacceptedEdits: aBoolean
]

{ #category : 'spec protocol' }
SpMorphicSpkCodeAdapter >> pendingText: aText [

	self widgetDo: [ :w | 
		w 
			setText: aText;
			hasUnacceptedEdits: true ]
]

{ #category : 'spec protocol' }
SpMorphicSpkCodeAdapter >> setHasUnacceptedEdits: aBoolean [

	self widgetDo: [ :w | w basicHasUnacceptedEdits: aBoolean ]
]
