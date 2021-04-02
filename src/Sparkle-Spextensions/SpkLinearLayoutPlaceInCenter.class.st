Class {
	#name : 'SpkLinearLayoutPlaceInCenter',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutPlaceInCenter >> layoutWithPlacementRule [

	"No submorphs have #spaceFill, so place extra space equally before and after the submorphs."

	self adjacentLayoutStartingAt: self extraSpace // 2
]

{ #category : 'as yet unclassified' }
SpkLinearLayoutPlaceInCenter >> placeRigidsOnly [

	"In this class it is expected that the argument to startingAt: will be negative,
	and that the endCoord will be beyond my bounds."

	self
		adjacentLayoutCells: (cells select: [ :cell | cell isRigid ])
		startingAt: self availableSpace - totalRigidSize // 2
]
