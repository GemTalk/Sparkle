Class {
	#name : 'SpkSplitterMove',
	#superclass : 'Object',
	#instVars : [
		'layoutMorph',
		'mouseInitialPosition',
		'allocatedSpaceBeforeSplitter',
		'allocatedSpaceAfterSplitter',
		'submorphBeforeSplitter',
		'submorphsBeforeSplitter',
		'submorphAfterSplitter',
		'submorphsAfterSplitter',
		'initialPriorities',
		'initialAllocatedSpaces'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'instance creation' }
SpkSplitterMove class >> forLayoutMorph: anAccordianLayoutMorph splitter: aSplitterMorph [

	^ self new
		  initializeFromLayoutMorph: anAccordianLayoutMorph
		  splitter: aSplitterMorph;
		  yourself
]

{ #category : 'private' }
SpkSplitterMove >> expand: aMorph by: numberOfPixels [

	"NumberOfPixels affects allocated space, and is relative to initial allocated space."

	| newPriority oldPriority oldAllocatedSpace newAllocatedSpace |
	oldPriority := initialPriorities at: aMorph.
	oldAllocatedSpace := initialAllocatedSpaces at: aMorph.
	newAllocatedSpace := oldAllocatedSpace + numberOfPixels.
	newPriority := oldPriority * newAllocatedSpace / oldAllocatedSpace.
	layoutMorph setPriorityOf: aMorph to: newPriority
]

{ #category : 'initialization' }
SpkSplitterMove >> initializeFromLayoutMorph: anAccordianLayoutMorph splitter: splitterMorph [

	| submorphCollection overallAllocatedSpace |
	layoutMorph := anAccordianLayoutMorph.
	overallAllocatedSpace := allocatedSpaceBeforeSplitter := allocatedSpaceAfterSplitter := 0.
	submorphCollection := submorphsBeforeSplitter := OrderedCollection
		                                                 new.
	submorphsAfterSplitter := OrderedCollection new.
	initialPriorities := IdentityDictionary new.
	initialAllocatedSpaces := IdentityDictionary new.

	layoutMorph submorphsDo: [ :each | 
		each == splitterMorph ifTrue: [ 
			submorphCollection := submorphsAfterSplitter.
			allocatedSpaceBeforeSplitter := overallAllocatedSpace.
			overallAllocatedSpace := 0 ].
		(layoutMorph isVariableSize: each) ifTrue: [ 
			| allocatedSpace |
			allocatedSpace := self spaceAllocatedTo: each.
			submorphCollection add: each.
			overallAllocatedSpace := overallAllocatedSpace + allocatedSpace.
			initialAllocatedSpaces at: each put: allocatedSpace.
			initialPriorities at: each put: (layoutMorph priorityOf: each) ] ].

	allocatedSpaceAfterSplitter := overallAllocatedSpace.
	submorphBeforeSplitter := submorphsBeforeSplitter last.
	submorphAfterSplitter := submorphsAfterSplitter first
]

{ #category : 'accessing' }
SpkSplitterMove >> mouseInitialPosition: anInteger [

	"Mouse position in the primary coordinate of my layout"

	mouseInitialPosition := anInteger
]

{ #category : 'private' }
SpkSplitterMove >> restorePrioritiesOf: morphs [

	"In the case of multi-pixel splitter moves through the initial position,
	priorities could be left non-initial. Restore them at each move just in case."

	morphs do: [ :each | 
		layoutMorph setPriorityOf: each to: (initialPriorities at: each) ]
]

{ #category : 'initialization' }
SpkSplitterMove >> spaceAllocatedTo: aMorph [

	"Allocated space is space beyond the minimum size of the morph."

	| minimum overall xform |
	xform := layoutMorph coordinateTransform.
	minimum := (xform pResizingOf: aMorph) == #rigid
		           ifTrue: [ xform pMinimumSizeOf: aMorph ]
		           ifFalse: [ 10 ].
	overall := xform pExtentOf: aMorph.
	^ overall - minimum
]

{ #category : 'public' }
SpkSplitterMove >> splitterMovedTo: mouseCurrentPosition [

	"mouseCurrentPosition is an integer"

	| morphsToSqueeze morphToExpand morphsToRestore splitterDisplacement allocatedSpaceToSqueeze |
	mouseCurrentPosition < mouseInitialPosition
		ifTrue: [ 
			morphsToSqueeze := submorphsBeforeSplitter.
			allocatedSpaceToSqueeze := allocatedSpaceBeforeSplitter.
			morphToExpand := submorphAfterSplitter.
			morphsToRestore := submorphsAfterSplitter copyWithout:
				                   submorphAfterSplitter ]
		ifFalse: [ 
			morphsToSqueeze := submorphsAfterSplitter.
			allocatedSpaceToSqueeze := allocatedSpaceAfterSplitter.
			morphToExpand := submorphBeforeSplitter.
			morphsToRestore := submorphsBeforeSplitter copyWithout:
				                   submorphBeforeSplitter ].

	splitterDisplacement := (mouseInitialPosition - mouseCurrentPosition)
		                        abs min: allocatedSpaceToSqueeze.

	self
		squeeze: morphsToSqueeze
		by: splitterDisplacement / allocatedSpaceToSqueeze;
		expand: morphToExpand by: splitterDisplacement;
		restorePrioritiesOf: morphsToRestore
]

{ #category : 'private' }
SpkSplitterMove >> squeeze: morphs by: factor [

	"Factor of 0, no squeezing. Factor >= 1 results in priorities of 0."

	| proportion |
	proportion := 1 - factor.

	morphs do: [ :each | 
		layoutMorph
			setPriorityOf: each
			to: (initialPriorities at: each) * proportion ]
]
