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
		'totalRigidSize',
		'bounds',
		'minimumPrimarySize',
		'minimumSecondarySize',
		'xform'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayout >> adjacentLayoutCells: someCells startingAt: gap [

	"Just pack 'em in, starting after a specified gap.
	The gap may be negative.
	Answer the coordinate after the last cell placed."

	| p sStart sEnd |
	p := (xform pStartOf: bounds) + gap.
	sStart := xform sStartOf: bounds.
	sEnd := xform sEndOf: bounds.

	someCells do: [ :cell | 
		| pEnd rect |
		pEnd := p + cell minimumSize.
		rect := xform
			        rectanglePStart: p
			        pEnd: pEnd
			        sStart: sStart
			        sEnd: sEnd.
		cell targetMorph layoutInBounds: rect.
		p := pEnd ].
	^ p
]

{ #category : 'layout' }
SpkLinearLayout >> adjacentLayoutStartingAt: gap [

	"Just pack 'em in, starting after a specified gap.
	Used when all rigids will fit in available space."

	| p |
	p := self adjacentLayoutCells: cells startingAt: gap. 
	p > (xform pEndOf: bounds) ifTrue: [ self error: 'Layout overrun' ]
]

{ #category : 'private' }
SpkLinearLayout >> availableSpace [

	^ xform pExtentOf: bounds
]

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
	totalRigidSize > self availableSpace ifTrue: [ 
		^ self placeRigidsOnly ].
	self extraSpace < 0 ifTrue: [ ^ self layoutTrimming ].
	numberOfSpaceFills > 0 ifTrue: [ ^ self layoutWithSpaceFills ].
	self layoutWithPlacementRule
]

{ #category : 'accessing' }
SpkLinearLayout >> coordinateTransform: aTransform [

	xform := aTransform
]

{ #category : 'private' }
SpkLinearLayout >> extraSpace [

	"Only valid after #scanSubmorphs"

	^ self availableSpace - minimumPrimarySize
]

{ #category : 'layout' }
SpkLinearLayout >> layoutTrimming [

	"We don't have enough space for the minimum size of all our submorphs.
	The available primary (p) space is allocated first to #rigid submorphs
	  * If there isn't enough p size for just the #rigid ones, they will be
		 truncated according to the placement rule, and we won't get to this method.
	Any space left over is then allocated to #spaceFill and #shrinkWrap submorphs."

	| deficit cellsToTrim totalNonRigidSize p sStart sEnd |
	deficit := self extraSpace negated.
	cellsToTrim := cells reject: [ :cell | cell isRigid ].
	totalNonRigidSize := cellsToTrim
		                     inject: 0
		                     into: [ :sum :cell | sum + cell minimumSize ].
	p := xform pStartOf: bounds.
	sStart := xform sStartOf: bounds.
	sEnd := xform sEndOf: bounds.

	cells do: [ :cell | 
		| cellTrim trimmedSize pEnd rect |
		cell isRigid
			ifTrue: [ cellTrim := 0 ]
			ifFalse: [ 
				| cellPortion |
				cellPortion := cell minimumSize asFloat / totalNonRigidSize.
				cellTrim := (cellPortion * deficit) ceiling ].
		trimmedSize := cell minimumSize - cellTrim.
		pEnd := p + trimmedSize.
		rect := xform
			        rectanglePStart: p
			        pEnd: pEnd
			        sStart: sStart
			        sEnd: sEnd.
		cell targetMorph layoutInBounds: rect.
		p := pEnd ].
	p > (xform pEndOf: bounds) ifTrue: [ self error: 'Layout overrun' ]
]

{ #category : 'layout' }
SpkLinearLayout >> layoutWithPlacementRule [

	"No submorphs have #spaceFill, so place any extra space according to my alignment."

	self subclassResponsibility
]

{ #category : 'layout' }
SpkLinearLayout >> layoutWithSpaceFills [

	"At least one submorph is #spaceFill, so allocate any extra space equally among those."

	| extraPerSpaceFill p sStart sEnd |
	extraPerSpaceFill := self extraSpace // numberOfSpaceFills.
	p := xform pStartOf: bounds.
	sStart := xform sStartOf: bounds.
	sEnd := xform sEndOf: bounds.

	cells do: [ :cell | 
		| pEnd rect |
		pEnd := p + cell minimumSize.
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
SpkLinearLayout >> minExtent [

	"Answer the minimum extent of my morph, which is expected to be polymorphic with SpkLayoutMorph."
	
	self scanSubmorphs.
	^ ( xform rectanglePStart: 0 pEnd: minimumPrimarySize  sStart: 0 sEnd: minimumSecondarySize ) extent
	 
]

{ #category : 'accessing' }
SpkLinearLayout >> morph: anObject [
	morph := anObject
]

{ #category : 'accessing' }
SpkLinearLayout >> numberOfCells [

	^ cells size
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

{ #category : 'as yet unclassified' }
SpkLinearLayout >> placeRigidsOnly [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkLinearLayout >> policy: anObject [
	policy := anObject
]

{ #category : 'private' }
SpkLinearLayout >> sMinimumSizeOf: aMorph [

	"What is the minimum size along the secondary axis to display aMorph?"

	^ xform sMinimumSizeOf: aMorph
]

{ #category : 'layout' }
SpkLinearLayout >> scanSubmorphs [

	"See how many submorphs there are, how many are #spaceFill, 
	and compute total of minimum space along the primary axis.
	Cache some of this information in LayoutCells"

	numberOfSpaceFills := minimumPrimarySize := minimumSecondarySize := totalRigidSize := 0.
	cells := OrderedCollection new.
	morph submorphsDo: [ :submorph | 
		| cell resizing |
		cell := cells add: (SpkLinearLayoutCell forMorph: submorph).
		resizing := self pResizingOf: submorph.
		cell minimumSize: (self pMinimumSizeOf: submorph).
		minimumSecondarySize := minimumSecondarySize max:
			                        (self sMinimumSizeOf: submorph).
		resizing == #spaceFill ifTrue: [ 
			cell isSpaceFill: true.
			numberOfSpaceFills := numberOfSpaceFills + 1 ].
		minimumPrimarySize := minimumPrimarySize + cell minimumSize.
		resizing == #rigid ifTrue: [ 
			cell beRigid.
			totalRigidSize := totalRigidSize + cell minimumSize ] ]
]
