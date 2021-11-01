Class {
	#name : 'SpkAccordianLinearLayout',
	#superclass : 'Object',
	#instVars : [
		'policy',
		'morph',
		'cells',
		'bounds',
		'xform',
		'totalMinimumSize',
		'sumOfGrantsTimesRequests'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkAccordianLinearLayout >> adjacentLayoutCells: someCells startingAt: gap [

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
SpkAccordianLinearLayout >> adjacentLayoutStartingAt: gap [

	"Just pack 'em in, starting after a specified gap.
	Used when all rigids will fit in available space."

	| p |
	p := self adjacentLayoutCells: cells startingAt: gap. 
	p > (xform pEndOf: bounds) ifTrue: [ self error: 'Layout overrun' ]
]

{ #category : 'private' }
SpkAccordianLinearLayout >> allocatableSpace [

	"Only valid after #scanSubmorphs"

	^ self availableSpace - totalMinimumSize
]

{ #category : 'private' }
SpkAccordianLinearLayout >> availableSpace [

	^ xform pExtentOf: bounds
]

{ #category : 'accessing' }
SpkAccordianLinearLayout >> bounds: anObject [
	bounds := anObject
]

{ #category : 'layout' }
SpkAccordianLinearLayout >> computeLayout [

	"Along the primary direction, compute the minimum for each submorph.
	If the minimum is less space than we have, trim each submorph to make them all fit.
	Otherwise, divide the extra space among the submorphs that specify #spaceFill.
	If there are none, place the extra space according to my primary-axis alignment."

	self scanSubmorphs.
	self allocatableSpace < 0 ifTrue: [ ^ self layoutTrimming ].
	self layoutAllocating
]

{ #category : 'accessing' }
SpkAccordianLinearLayout >> coordinateTransform [

	^ xform
]

{ #category : 'accessing' }
SpkAccordianLinearLayout >> coordinateTransform: aTransform [

	xform := aTransform
]

{ #category : 'testing' }
SpkAccordianLinearLayout >> isRigid: aMorph [

	^ (xform pResizingOf: aMorph) == #rigid
]

{ #category : 'layout' }
SpkAccordianLinearLayout >> layoutAllocating [

	"We have some extra space to allocate among our variable-size submorphs.
	Allocate to each according to priority.
	
	Each variable submorph's size and allocation is computed this way:
  overallSize = minimumSize + allocatedSize.
  allocatedSize = priority * desiredAllocation * allocatableSpace / (desiredAllocations sum * priorities sum).
	"

	| allocationProportion p sStart sEnd |
	allocationProportion := self allocatableSpace asFloat
	                        / sumOfGrantsTimesRequests.
	p := xform pStartOf: bounds.
	sStart := xform sStartOf: bounds.
	sEnd := xform sEndOf: bounds.

	cells do: [ :cell | 
		| pEnd rect |
		pEnd := p + cell minimumSize.
		cell isRigid ifFalse: [ 
			pEnd := pEnd + (cell allocationFactor * allocationProportion) floor ].
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
SpkAccordianLinearLayout >> layoutTrimming [

	"We don't have enough space for the minimum size of all our submorphs.
	Trim each proportionally to their minimum size.
	It would be better to prevent this case from happening by setting the 
	minimumExtent of the window, and limiting the number of columns and panes
	appropriately, but we don't want to totally break when there's not
	enough space."

	| deficit p sStart sEnd |
	deficit := self allocatableSpace negated.
	p := xform pStartOf: bounds.
	sStart := xform sStartOf: bounds.
	sEnd := xform sEndOf: bounds.

	cells do: [ :cell | 
		| cellTrim trimmedSize pEnd rect cellPortion |
		cellPortion := cell minimumSize asFloat / self availableSpace.
		cellTrim := (cellPortion * deficit) ceiling.
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

{ #category : 'accessing' }
SpkAccordianLinearLayout >> morph: anObject [
	morph := anObject
]

{ #category : 'accessing' }
SpkAccordianLinearLayout >> numberOfCells [

	^ cells size
]

{ #category : 'private' }
SpkAccordianLinearLayout >> optimalAllocatedSizeOf: aMorph [

	^ morph optimalAllocatedSizeOf: aMorph
]

{ #category : 'private' }
SpkAccordianLinearLayout >> pMinimumSizeOf: aMorph [

	"What is the minimum size along the primary axis to display aMorph?"

	^ xform pMinimumSizeOf: aMorph
]

{ #category : 'private' }
SpkAccordianLinearLayout >> placeRigidsOnly [

	self
		adjacentLayoutCells: (cells select: [ :cell | cell isRigid ])
		startingAt: 0
	"It is expected that this will end beyond the available space,
	this overrun is not an error"
]

{ #category : 'accessing' }
SpkAccordianLinearLayout >> policy: anObject [
	policy := anObject
]

{ #category : 'private' }
SpkAccordianLinearLayout >> resizingOf: aMorph [

	"What is the resizing attribute of the morph along my primary axis?"

	^ xform pResizingOf: aMorph
]

{ #category : 'layout' }
SpkAccordianLinearLayout >> scanSubmorphs [

	"See how many submorphs there are, how many are #spaceFill, 
	and compute total of minimum space along the primary axis.
	Cache some of this information in LayoutCells"

	sumOfGrantsTimesRequests := totalMinimumSize := 0.
	cells := OrderedCollection new.
	morph submorphsDo: [ :submorph | 
		| cell |
		cell := cells add: (SpkAccordianLayoutCell forMorph: submorph).
		cell minimumSize: (self pMinimumSizeOf: submorph).
		totalMinimumSize := totalMinimumSize + cell minimumSize.
		(self isRigid: submorph)
			ifTrue: [ cell beRigid ]
			ifFalse: [ 
				cell
					beVariable;
					allocationFactor:
						(self optimalAllocatedSizeOf: submorph)
						* (morph priorityOf: submorph).
				sumOfGrantsTimesRequests := sumOfGrantsTimesRequests
				                            + cell allocationFactor ] ]
]
