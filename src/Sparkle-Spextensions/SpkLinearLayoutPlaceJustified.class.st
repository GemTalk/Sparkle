"
Split extra space between submorphs, resulting in fully-justified submorphs.
"
Class {
	#name : 'SpkLinearLayoutPlaceJustified',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutPlaceJustified >> layoutWithPlacementRule [

	"No submorphs have #spaceFill, so place any extra space to make the submorphs fully justified."

	| spacing p sStart sEnd |
	self numberOfCells > 1 ifFalse: [ 
		self adjacentLayoutStartingAt: 0.
		^ self ].
	spacing := self extraSpace // (self numberOfCells - 1).

	p := xform pStartOf: bounds.
	sStart := xform sStartOf: bounds.
	sEnd := xform sEndOf: bounds.

	cells do: [ :cell | 
		| pEnd rect |
		pEnd := p + cell minimumSize.
		rect := xform
			        rectanglePStart: p
			        pEnd: pEnd
			        sStart: sStart
			        sEnd: sEnd.
		cell targetMorph layoutInBounds: rect.
		p := pEnd + spacing ].
	p - spacing > (xform pEndOf: bounds) ifTrue: [ 
		self error: 'Layout overrun' ]
]

{ #category : 'as yet unclassified' }
SpkLinearLayoutPlaceJustified >> placeRigidsOnly [

	"Can't really 'justify' in an overflow situation, so same as start placement
	in this case."

	self
		adjacentLayoutCells: (cells select: [ :cell | cell isRigid ])
		startingAt: 0
	"It is expected that this will end beyond the available space,
	this overrun is not an error"
]
