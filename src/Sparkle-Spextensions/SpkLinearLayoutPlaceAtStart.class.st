"
Place extra space at the end, resulting in left/top justified submorphs.
"
Class {
	#name : 'SpkLinearLayoutPlaceAtStart',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutPlaceAtStart >> layoutWithPlacementRule [

	"No submorphs have #spaceFill, so place any extra space at the end, after the submorphs"

	self adjacentLayoutStartingAt: 0
]

{ #category : 'as yet unclassified' }
SpkLinearLayoutPlaceAtStart >> placeRigidsOnly [

	self
		adjacentLayoutCells: (cells select: [ :cell | cell isRigid ])
		startingAt: 0
	"It is expected that this will end beyond the available space,
	this overrun is not an error"
]
