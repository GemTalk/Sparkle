"
A simple button with icon that can be enabled and disabled, and does _not_ use a table layout.
"
Class {
	#name : 'SpkIconicButtonMorph',
	#superclass : 'IconicButtonMorph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Morphic',
	#package : 'Sparkle-Spextensions',
	#tag : 'Morphic'
}

{ #category : 'button' }
SpkIconicButtonMorph >> doButtonAction [

	self enabled ifFalse: [ ^ self ].
	super doButtonAction
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> enabled: requestedBoolean [

	| shouldEnable |
	shouldEnable := target enablementFrom: requestedBoolean.
	self submorphsDo: [ :morph | morph enabled: shouldEnable ].
	enabled := shouldEnable
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> extraBorder [

	^ 0
]

{ #category : 'layout' }
SpkIconicButtonMorph >> layoutInBounds: cellBounds [
	"Iconic buttons always want to be the same size as their graphic."
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
