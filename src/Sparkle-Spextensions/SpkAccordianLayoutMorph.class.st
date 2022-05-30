Class {
	#name : 'SpkAccordianLayoutMorph',
	#superclass : 'SpkLayoutMorph',
	#instVars : [
		'priorities',
		'currentSplitterMove'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'layout' }
SpkAccordianLayoutMorph >> assureLayoutProperties [

	| props |
	props := self layoutProperties.
	props == self ifTrue: [ props := nil ].
	props ifNil: [ 
		props := SpkLinearLayoutProperties new initializeFrom: self.
		self layoutProperties: props ].
	^ props
]

{ #category : 'accessing' }
SpkAccordianLayoutMorph >> coordinateTransform [

	^ self assureLayoutProperties coordinateTransform
]

{ #category : 'splitter' }
SpkAccordianLayoutMorph >> endSplitterMoveFor: aSplitterMorph at: aMousePoint [

	self splitterMoveFor: aSplitterMorph at: aMousePoint.
	currentSplitterMove := nil
]

{ #category : 'initialization' }
SpkAccordianLayoutMorph >> initialize [

	super initialize.
	priorities := IdentityDictionary new
]

{ #category : 'splitter' }
SpkAccordianLayoutMorph >> isVariableSize: aMorph [

	^ (self coordinateTransform pResizingOf: aMorph) ~~ #rigid
]

{ #category : 'accessing' }
SpkAccordianLayoutMorph >> minExtent [

	^ 0 @ 0
]

{ #category : 'private' }
SpkAccordianLayoutMorph >> optimalAllocatedSizeOf: aMorph [

	"What size, beyond the minimum size, 
	would be needed to fully display the given morph?
	This applies only to variable-size submorphs.
	For now, guess, and computation will be not-as-smart as desired."

	^ 100
]

{ #category : 'accessing' }
SpkAccordianLayoutMorph >> priorityOf: aSubmorph [

	^ priorities at: aSubmorph ifAbsentPut: [ 1.0 ]
]

{ #category : 'accessing' }
SpkAccordianLayoutMorph >> setPriorityOf: aSubmorph to: aNumber [

	priorities at: aSubmorph put: aNumber
]

{ #category : 'splitter' }
SpkAccordianLayoutMorph >> splitterMoveFor: aSplitterMorph at: aMousePoint [

	currentSplitterMove ifNil: [ 
		^ self error: 'No splitter move in progress' ].
	currentSplitterMove splitterMovedTo:
		(self coordinateTransform pOf: aMousePoint).
	self layoutChanged
]

{ #category : 'splitter' }
SpkAccordianLayoutMorph >> startSplitterMoveFor: aSplitterMorph at: aMousePoint [

	currentSplitterMove ifNotNil: [ "Most likely, mouse up happened outside of Pharo,
						and this mouse down should be ignored by this morph.
						That causes this mouse down event to be ignored.
						This appears to be a limitation in Morphic mouse event dispatching." 
		currentSplitterMove := nil ].
	currentSplitterMove := SpkSplitterMove
		                       forLayoutMorph: self
		                       splitter: aSplitterMorph.
	currentSplitterMove mouseInitialPosition:
		(self coordinateTransform pOf: aMousePoint)
]
