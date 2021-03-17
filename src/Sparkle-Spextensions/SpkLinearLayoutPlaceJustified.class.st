Class {
	#name : 'SpkLinearLayoutPlaceJustified',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutPlaceJustified >> layoutWithAlignment [

	"No submorphs have #spaceFill, so place any extra space according to my alignment."

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
		pEnd := p + cell pMinimumSize.
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
