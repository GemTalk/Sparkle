"
Abstract. My subclasses handle transformations between a (primary, secondary) coordinate system and an (x, y) coordinate system. This lets the layout think in terms of p and s coordinates, instead of having to remember which is x and which is y.
"
Class {
	#name : 'SpkCoordinateTransform',
	#superclass : 'Object',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'accessing' }
SpkCoordinateTransform class >> new [

	self shouldNotImplement
]

{ #category : 'accessing' }
SpkCoordinateTransform class >> uniqueInstance [

	self = SpkCoordinateTransform ifTrue: [ 
		self error: 'I''m abstract, use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : 'accessing' }
SpkCoordinateTransform >> pEndOf: aRectangle [

	"Answer the ending coordinate on the primary axis of a layout rectangle."

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> pExtentOf: aRectangle [

	"Answer the size of aRectangle along the primary axis"

	^ self pOf: aRectangle extent
]

{ #category : 'accessing' }
SpkCoordinateTransform >> pMinimumSizeOf: aMorph [

	"What is the minimum size along the primary axis to display aMorph?"

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> pOf: aPoint [

	"Answer the coordinate of aPoint on the primary axis."

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> pResizingOf: aMorph [

	"Answer the resizing attribute of aMorph along my primary axis"

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> pStartOf: aRectangle [

	"Answer the starting coordinate on the primary axis of a layout rectangle."

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> pointP: p s: s [

	"Answer a Point in x-y coordinates given the primary-secondary coordinates"

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> rectanglePStart: pStart pEnd: pEnd sStart: sStart sEnd: sEnd [

	"Answer a rectangle in x-y coordinates having the given four sides in p-s coordinates."

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> sEndOf: aRectangle [

	"Answer the ending coordinate on the secondary axis of a layout rectangle."

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCoordinateTransform >> sStartOf: aRectangle [

	"Answer the starting coordinate on the secondary axis of a layout rectangle."

	self subclassResponsibility
]
