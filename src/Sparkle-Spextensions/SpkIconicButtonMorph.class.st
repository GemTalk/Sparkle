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

{ #category : 'TEMP' }
SpkIconicButtonMorph >> SETASIDEadjustLayoutBounds [
	"Adjust the receivers bounds depending on the resizing strategy imposed"

	| hFit vFit box myExtent extent |
	hFit := self hResizing.
	vFit := self vResizing.
	(hFit == #shrinkWrap or: [ vFit == #shrinkWrap ])
		ifFalse: [ ^ self ].	"not needed"
	box := self layoutBounds.
	myExtent := box extent.
	extent := self submorphBounds extent.
	hFit == #shrinkWrap
		ifTrue: [ myExtent := extent x @ myExtent y ].
	vFit == #shrinkWrap
		ifTrue: [ myExtent := myExtent x @ extent y ].	"Make sure we don't get smaller than minWidth/minHeight"
	myExtent x < self minWidth
		ifTrue: [ myExtent := (myExtent x max: self minWidth - self bounds width + self layoutBounds width) @ myExtent y ].
	myExtent y < self minHeight
		ifTrue: [ myExtent := myExtent x @ (myExtent y max: self minHeight - self bounds height + self layoutBounds height) ].
	self layoutBounds: (box origin extent: myExtent)
]

{ #category : 'TEMP' }
SpkIconicButtonMorph >> SETASIDEextent: aPoint [

	| oldBounds newBounds |
	oldBounds := bounds copy.
	super extent: aPoint.
	newBounds := bounds copy.
	Transcript crShow:
		oldBounds printString , ' extent: -> ' , newBounds printString
		, ' X ' , newBounds extent printString
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> SETASIDElabelGraphic: aForm [
	"Changed to look for any image morph rather than just a sketch."

	graphicalMorph ifNotNil: [ graphicalMorph delete ].
	graphicalMorph := ImageMorph new form: aForm.
	self extent: graphicalMorph extent. "Unconditionally shrinkwrap."
	graphicalMorph position: bounds origin.
	self addMorph: graphicalMorph.
	graphicalMorph lock
]

{ #category : 'TEMP' }
SpkIconicButtonMorph >> SETASIDElayoutBounds: aRectangle [

	| oldBounds newBounds |
	oldBounds := bounds copy.
	super layoutBounds: aRectangle.
	newBounds := bounds copy.
	Transcript crShow:
		oldBounds printString , ' layoutBounds: -> ' , newBounds printString
		, ' X ' , newBounds extent printString
]

{ #category : 'TEMP' }
SpkIconicButtonMorph >> SETASIDElayoutInBounds: cellBounds [
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

{ #category : 'TEMP' }
SpkIconicButtonMorph >> SETASIDEprivateMoveBy: delta [

	| oldBounds newBounds |
	oldBounds := bounds copy.
	super privateMoveBy: delta.
	newBounds := bounds copy.
	Transcript crShow:
		oldBounds printString , ' privateMoveBy: -> '
		, newBounds printString , ' X ' , newBounds extent printString
]

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

{ #category : 'accessing' }
SpkIconicButtonMorph >> labelGraphic: aForm [
	"Changed to look for any image morph rather than just a sketch."
	
	graphicalMorph ifNotNil: [graphicalMorph delete].
	graphicalMorph := ImageMorph new form: aForm.
	graphicalMorph position: self center - (graphicalMorph extent // 2).
	self addMorph: graphicalMorph.
	graphicalMorph lock
]

{ #category : 'TEMP' }
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
