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
SpkIconicButtonMorph >> adjustLayoutBounds [
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

{ #category : 'TEMP' }
SpkIconicButtonMorph >> extent: aPoint [

	| oldBounds newBounds |
	oldBounds := bounds copy.
	super extent: aPoint.
	newBounds := bounds copy.
	Transcript crShow:
		oldBounds printString , ' extent: -> ' , newBounds printString
		, ' X ' , newBounds extent printString
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> extraBorder [

	^ 0
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> labelGraphic: aForm [
	"Changed to look for any image morph rather than just a sketch."

	graphicalMorph ifNotNil: [ graphicalMorph delete ].
	graphicalMorph := ImageMorph new form: aForm.
	self extent: graphicalMorph extent. "Unconditionally shrinkwrap."
	graphicalMorph position: bounds origin.
	self addMorph: graphicalMorph.
	graphicalMorph lock
]

{ #category : 'TEMP' }
SpkIconicButtonMorph >> layoutBounds: aRectangle [

	| oldBounds newBounds |
	oldBounds := bounds copy.
	super layoutBounds: aRectangle.
	newBounds := bounds copy.
	Transcript crShow:
		oldBounds printString , ' layoutBounds: -> ' , newBounds printString
		, ' X ' , newBounds extent printString
]

{ #category : 'TEMP' }
SpkIconicButtonMorph >> privateMoveBy: delta [

	| oldBounds newBounds |
	oldBounds := bounds copy.
	super privateMoveBy: delta.
	newBounds := bounds copy.
	Transcript crShow:
		oldBounds printString , ' privateMoveBy: -> '
		, newBounds printString , ' X ' , newBounds extent printString
]
