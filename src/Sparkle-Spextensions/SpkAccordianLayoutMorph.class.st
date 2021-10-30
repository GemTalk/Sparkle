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

	currentSplitterMove ifNotNil: [ 
		^ self error: 'Splitter move already in progress' ].
	currentSplitterMove := SpkSplitterMove
		                       forLayoutMorph: self
		                       splitter: aSplitterMorph.
	currentSplitterMove mouseInitialPosition:
		(self coordinateTransform pOf: aMousePoint)
]
