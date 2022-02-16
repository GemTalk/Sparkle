"
Place extra space at the beginning, resulting in right/bottom justified submorphs.
"
Class {
	#name : 'SpkLinearLayoutPlaceAtEnd',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutPlaceAtEnd >> layoutWithPlacementRule [

	"No submorphs have #spaceFill, so place the extra space at the start, before the submorphs"

	self adjacentLayoutStartingAt: self extraSpace
]

{ #category : 'as yet unclassified' }
SpkLinearLayoutPlaceAtEnd >> placeRigidsOnly [
	"In this class it is expected that the argument to startingAt: will be negative "
	| endCoord |
	endCoord := self
		            adjacentLayoutCells:
		            (cells select: [ :cell | cell isRigid ])
		            startingAt: self availableSpace - totalRigidSize.
	endCoord > (xform pEndOf: bounds) ifTrue: [ 
		self error: 'Layout overrun' ]
]
