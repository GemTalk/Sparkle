Class {
	#name : 'SpkLabelMorph',
	#superclass : 'LabelMorph',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'as yet unclassified' }
SpkLabelMorph >> layoutInBounds: cellBounds [
	"Layout specific. Apply the given bounds to the receiver after being layed out in its owner."
	| box aSymbol |
	
	cellBounds = self bounds ifTrue:[^self]. "already up to date. Fixed here to use bounds rather than fullBounds for the check."
	cellBounds extent = self bounds extent "nice fit. Fixed here to use bounds rather than fullBounds for the check."
		ifTrue:[^self position: cellBounds origin].
	box := bounds.
	"match #spaceFill constraints"
	box := box origin extent: cellBounds width @ box height.
	box := box origin extent: box width @ cellBounds height.
	"align accordingly"
	aSymbol := (owner ifNil:[self]) cellPositioning.
	box := box align: (box perform: aSymbol) with: (cellBounds perform: aSymbol).
	"and install new bounds"
	self bounds: box.
]
