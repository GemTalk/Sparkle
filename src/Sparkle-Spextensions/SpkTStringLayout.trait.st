"
Used by string-ish morphs.

Try to lay out so it doesn't draw neighboring strings in the same layout (as in a table, for instance).
"
Trait {
	#name : 'SpkTStringLayout',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'layout' }
SpkTStringLayout >> layoutInBounds: cellBounds [
	"Labels always want to show their entire text, but must clip themselves to the bounds given them
	by the layout."
	| cellExtent boundedExtent box aSymbol |
	
	cellBounds = self bounds ifTrue:[^self]. "already up to date. Fixed here to use bounds rather than fullBounds for the check."
	cellExtent := cellBounds extent.
	cellExtent = self bounds extent "nice fit. Fixed here to use bounds rather than fullBounds for the check."
		ifTrue:[^self position: cellBounds origin].
	boundedExtent := self optimalExtent min: cellExtent.
	box := self bounds origin extent: boundedExtent.
	"align"
	aSymbol := (self owner ifNil:[self]) cellPositioning.
	box := box align: (box perform: aSymbol) with: (cellBounds perform: aSymbol).
	"and install new bounds"
	self bounds: box.
]

{ #category : 'accessing' }
SpkTStringLayout >> minExtent [

	^ self optimalExtent
]

{ #category : 'geometry' }
SpkTStringLayout >> optimalExtent [ 

	^ self measureContents
]
