Class {
	#name : 'SpkLabelMorph',
	#superclass : 'LabelMorph',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'layout' }
SpkLabelMorph >> fontTopPadding [

	"Answer how much empty space to display above the ascent of the font,
	in order to roughly visually center it in the morph.
	This varies by font, but for Source Sans Pro, about half the descender 
	looks reasonably good."

	^ self fontToUse descent / 2.0
]

{ #category : 'layout' }
SpkLabelMorph >> minHeight [

	"Answer the receiver's minimum height.
	based on font height.
	Add additional height equal to the descender to make 
	the label visually centered on the ascenders of the font."

	| heightToUse |
	heightToUse := self fontToUse height + self fontTopPadding.
	^ heightToUse rounded max: super minHeight
]

{ #category : 'accessing' }
SpkLabelMorph >> stringBounds [

	| bnd gap |
	bnd := super stringBounds.
	gap := 0 @ self fontTopPadding.

	^ bnd topLeft + gap corner: bnd bottomRight
]
