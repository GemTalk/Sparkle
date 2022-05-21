Class {
	#name : 'SpkLabelMorph',
	#superclass : 'LabelMorph',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'layout' }
SpkLabelMorph >> layoutInBounds: cellBounds [
	"Labels always want to show their entire text, but must clip themselves to the bounds given them
	by the layout."
	| cellExtent boundedExtent box aSymbol |
	
	cellBounds = self bounds ifTrue:[^self]. "already up to date. Fixed here to use bounds rather than fullBounds for the check."
	cellExtent := cellBounds extent.
	cellExtent = self bounds extent "nice fit. Fixed here to use bounds rather than fullBounds for the check."
		ifTrue:[^self position: cellBounds origin].
	boundedExtent := self optimalExtent min: cellExtent.
	box := bounds origin extent: boundedExtent.
	"align"
	aSymbol := (owner ifNil:[self]) cellPositioning.
	box := box align: (box perform: aSymbol) with: (cellBounds perform: aSymbol).
	"and install new bounds"
	self bounds: box.
]

{ #category : 'accessing' }
SpkLabelMorph >> minExtent [

	^ self optimalExtent
]

{ #category : 'geometry' }
SpkLabelMorph >> optimalExtent [ 

	^ self measureContents
]
