"
A simple button with icon that can be enabled and disabled, and does _not_ use a table layout.
"
Class {
	#name : 'SpkIconicButtonMorph',
	#superclass : 'IconicButtonMorph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'button' }
SpkIconicButtonMorph >> doButtonAction [

	self enabled ifFalse: [ ^ self ].
	super doButtonAction
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> extraBorder [

	^ 0
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> labelGraphic: aForm [
	"Changed to look for any image morph rather than just a sketch."
	
	graphicalMorph ifNotNil: [graphicalMorph delete].
	graphicalMorph := ImageMorph new form: aForm.
	graphicalMorph position: self center - (graphicalMorph extent // 2).
	self addMorph: graphicalMorph.
	graphicalMorph lock
]
