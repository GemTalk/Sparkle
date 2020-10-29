"
I lay out the submorphs of a single morph according to an SpkLinearLayoutPolicy.
"
Class {
	#name : 'SpkLinearLayout',
	#superclass : 'Object',
	#instVars : [
		'policy',
		'morph',
		'cells',
		'numberOfSpaceFills',
		'bounds',
		'minimumPrimarySize',
		'xform'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'accessing' }
SpkLinearLayout >> bounds: anObject [
	bounds := anObject
]

{ #category : 'layout' }
SpkLinearLayout >> computeLayout [

	"Along the primary direction, compute the minimum for each submorph.
	If the minimum is less space than we have, trim each submorph to make them all fit.
	Otherwise, divide the extra space among the submorphs that specify #spaceFill.
	If there are none, place the extra space according to my primary-axis alignment."

	self scanSubmorphs.
	self extraSpace < 0 ifTrue: [ ^ self layoutTrimming ].
	numberOfSpaceFills > 0 ifTrue: [ ^ self layoutWithSpaceFills ].
	^ self layoutWithAlignment
]

{ #category : 'private' }
SpkLinearLayout >> extraSpace [

	^ (xform pExtentOf: bounds) - minimumPrimarySize
]

{ #category : 'layout' }
SpkLinearLayout >> layoutWithSpaceFills [

	| extraPerSpaceFill p sStart sEnd |
	extraPerSpaceFill := self extraSpace // numberOfSpaceFills.

	"Yer basic layout loop"
	p := xform pStartOf: bounds.
	sStart := xform sStartOf: bounds.
	sEnd := xform sEndOf: bounds.

	cells do: [ :cell | 
		| pEnd rect |
		pEnd := p + cell pMinimumSize.
		cell isSpaceFill ifTrue: [ pEnd := pEnd + extraPerSpaceFill ].
		rect := xform
			        rectanglePStart: p
			        pEnd: pEnd
			        sStart: sStart
			        sEnd: sEnd.
		cell targetMorph layoutInBounds: rect.
		p := pEnd ].
	p > (xform pEndOf: bounds) ifTrue: [ self error: 'Layout overrun' ]
]

{ #category : 'accessing' }
SpkLinearLayout >> morph: anObject [
	morph := anObject
]

{ #category : 'private' }
SpkLinearLayout >> pMinimumSizeOf: aMorph [

	"What is the minimum size along the primary axis to display aMorph?"

	^ xform pMinimumSizeOf: aMorph
]

{ #category : 'private' }
SpkLinearLayout >> pResizingOf: aMorph [

	"What is the resizing attribute of the morph along my primary axis?"

	^ xform pResizingOf: aMorph
]

{ #category : 'accessing' }
SpkLinearLayout >> policy: anObject [
	policy := anObject
]

{ #category : 'layout' }
SpkLinearLayout >> scanSubmorphs [

	"See how many submorphs there are, how many are #spaceFill, 
	and compute total of minimum space along the primary axis.
	Cache some if this information in LayoutCells"

	numberOfSpaceFills := minimumPrimarySize := 0.
	cells := OrderedCollection new.
	morph submorphsDo: [ :submorph | 
		| cell |
		cell := cells add: (SpkLayoutCell forMorph: submorph).
		cell pMinimumSize: (self pMinimumSizeOf: submorph).
		(self pResizingOf: submorph) == #spaceFill ifTrue: [ 
			cell isSpaceFill: true.
			numberOfSpaceFills := numberOfSpaceFills + 1 ].
		minimumPrimarySize := minimumPrimarySize + cell pMinimumSize ]
]
