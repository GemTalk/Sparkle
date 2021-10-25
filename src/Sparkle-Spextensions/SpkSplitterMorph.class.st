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

{ #category : 'accessing' }
SpkSplitterMorph >> index [

	^ index
]

{ #category : 'accessing' }
SpkSplitterMorph >> index: anObject [

	index := anObject
]

{ #category : 'initialization' }
SpkSplitterMorph >> setDefaultColors [

	handleColor := Color lightGray lighter lighter.
	dotColor := Color gray lighter
]

{ #category : 'accessing' }
SpkSplitterMorph >> xform [

	^ xform ifNil: [ xform := owner coordinateTransform ]
]
