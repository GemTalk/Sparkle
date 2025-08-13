"
The superclass inexplicably fails to remove the submorph when removing a segment, which may be a bug on Pharo 12. Since Pharo 13 is now out, just fix it here by inheritance.
"
Class {
	#name : 'SpkEditingArea',
	#superclass : 'RubEditingArea',
	#category : 'Sparkle-Spextensions-Morphic',
	#package : 'Sparkle-Spextensions',
	#tag : 'Morphic'
}

{ #category : 'accessing - segments' }
SpkEditingArea >> removeSegment: aRubTextSegmentMorph [
	"For the segment to not be shown you have to actually remove the submorph."

	super removeSegment: aRubTextSegmentMorph.
	self removeMorph: aRubTextSegmentMorph
]
