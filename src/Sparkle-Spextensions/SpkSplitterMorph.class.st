Class {
	#name : 'SpkSplitterMorph',
	#superclass : 'Morph',
	#instVars : [
		'handleColor',
		'dotColor',
		'dragStart',
		'xform',
		'index'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'accessing - defaults' }
SpkSplitterMorph class >> splitterWidth [

	^ 4
]

{ #category : 'instance creation' }
SpkSplitterMorph class >> withIndex: logicalIndex [

	^ self new
		  index: logicalIndex;
		  yourself
]

{ #category : 'initialization' }
SpkSplitterMorph >> dotColor [

	^ dotColor ifNil: [self setDefaultColors. dotColor]
]

{ #category : 'drawing' }
SpkSplitterMorph >> drawOn: aCanvas [

	| dotBounds size alphaCanvas dotSize |
	super drawOn: aCanvas.
	size := self handleSize.
	dotSize := self xform pointP: self class splitterWidth s: 6.
	alphaCanvas := aCanvas asAlphaBlendingCanvas: 0.7.
	dotBounds := Rectangle center: self bounds center extent: size.
	alphaCanvas fillRectangle: dotBounds color: self handleColor.
	dotBounds := Rectangle center: self bounds center extent: dotSize.
	alphaCanvas fillRectangle: dotBounds color: self dotColor
]

{ #category : 'initialization' }
SpkSplitterMorph >> handleColor [

	^ handleColor ifNil: [self setDefaultColors. handleColor]
]

{ #category : 'private' }
SpkSplitterMorph >> handleSize [

	^ self xform pointP: self class splitterWidth s: 30
]

{ #category : 'event handling' }
SpkSplitterMorph >> handlesMouseDown: anEvent [

	^ true
]

{ #category : 'event handling' }
SpkSplitterMorph >> handlesMouseOver: anEvent [

	^ true
]

{ #category : 'accessing' }
SpkSplitterMorph >> index [

	^ index
]

{ #category : 'accessing' }
SpkSplitterMorph >> index: anObject [

	index := anObject
]

{ #category : 'initialization' }
SpkSplitterMorph >> initialize [

	super initialize.
	self setNormalColor
]

{ #category : 'event handling' }
SpkSplitterMorph >> mouseDown: anEvent [

	"A mouse button has been pressed.
	Update the color for feedback and store the mouse
	position and relative offset to the receiver."

	| cp |
	self setGrabbedColor.
	cp := anEvent cursorPoint
	"owner startSplitterDragFor: self at: cp"
]

{ #category : 'event handling' }
SpkSplitterMorph >> mouseEnter: anEvent [

	self
		setInverseColors;
		changed.
	anEvent hand showTemporaryCursor: self resizeCursor
]

{ #category : 'event handling' }
SpkSplitterMorph >> mouseLeave: anEvent [

	self
		setDefaultColors;
		changed.
	anEvent hand showTemporaryCursor: nil
]

{ #category : 'event handling' }
SpkSplitterMorph >> mouseUp: anEvent [

	"Change the cursor back to normal if necessary and change the color back to normal."

	(self bounds containsPoint: anEvent cursorPoint) ifFalse: [ 
		anEvent hand showTemporaryCursor: nil ].
	self
		setNormalColor;
		setDefaultColors
	"	owner endSplitterDragFor: self."
]

{ #category : 'style' }
SpkSplitterMorph >> normalFillStyle [

	"Return the normal fillStyle of the receiver."

	^ SolidFillStyle color: Color veryDarkGray
]

{ #category : 'style' }
SpkSplitterMorph >> pressedFillStyle [

	"Return the pressed fillStyle of the receiver."

	^ SolidFillStyle color: Color darkGray
]

{ #category : 'actions' }
SpkSplitterMorph >> resizeCursor [

	^ Cursor resizeForEdge: (self splitsTopAndBottom
			   ifTrue: [ #top ]
			   ifFalse: [ #left ])
]

{ #category : 'initialization' }
SpkSplitterMorph >> setDefaultColors [

	handleColor := Color lightGray lighter lighter.
	dotColor := Color gray lighter
]

{ #category : 'initialization' }
SpkSplitterMorph >> setGrabbedColor [
	"Set the color of the receiver when it is grabbed."
	
	self fillStyle: self pressedFillStyle
]

{ #category : 'initialization' }
SpkSplitterMorph >> setInverseColors [

	handleColor := Color lightGray.
	dotColor := Color white
]

{ #category : 'initialization' }
SpkSplitterMorph >> setNormalColor [

	"Set the color of the receiver when it is grabbed."

	self fillStyle: self normalFillStyle
]

{ #category : 'accessing' }
SpkSplitterMorph >> splitsTopAndBottom [

	| layoutProperties |
	layoutProperties := self layoutProperties.
	^ layoutProperties vResizing == #rigid
]

{ #category : 'accessing' }
SpkSplitterMorph >> xform [

	^ xform ifNil: [ xform := owner coordinateTransform ]
]
