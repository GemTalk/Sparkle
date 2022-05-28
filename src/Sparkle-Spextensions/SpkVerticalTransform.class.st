"
My primary axis is vertical (y), secondary is horizontal (x).
"
Class {
	#name : 'SpkVerticalTransform',
	#superclass : 'SpkCoordinateTransform',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'accessing' }
SpkVerticalTransform >> pEndOf: aRectangle [

	"Answer the ending coordinate on the primary axis of a layout rectangle."

	^ aRectangle bottom
]

{ #category : 'accessing' }
SpkVerticalTransform >> pMinimumSizeOf: aMorph [

	"What is the minimum size along the primary axis to display aMorph?"

	^ aMorph minExtent y
]

{ #category : 'accessing' }
SpkVerticalTransform >> pOf: aPoint [

	"Answer the coordinate of aPoint on the primary axis."

	^ aPoint y
]

{ #category : 'accessing' }
SpkVerticalTransform >> pResizingOf: aMorph [

	"Answer the resizing attribute of aMorph along my primary axis"

	^ aMorph vResizing
]

{ #category : 'accessing' }
SpkVerticalTransform >> pStartOf: aRectangle [

	"Answer the starting coordinate on the primary axis of a layout rectangle."

	^ aRectangle top
]

{ #category : 'accessing' }
SpkVerticalTransform >> pointP: p s: s [

	"Answer a Point in x-y coordinates given the primary-secondary coordinates"

	^ s @ p
]

{ #category : 'accessing' }
SpkVerticalTransform >> rectanglePStart: pStart pEnd: pEnd sStart: sStart sEnd: sEnd [

	"Answer a rectangle in x-y coordinates having the given four sides in p-s coordinates."

	^ Rectangle
		  left: sStart
		  right: sEnd
		  top: pStart
		  bottom: pEnd
]

{ #category : 'accessing' }
SpkVerticalTransform >> sEndOf: aRectangle [

	"Answer the ending coordinate on the secondary axis of a layout rectangle."

	^ aRectangle right
]

{ #category : 'accessing' }
SpkVerticalTransform >> sMinimumSizeOf: aMorph [

	"What is the minimum size along the secondary axis to display aMorph?"

	^ aMorph minExtent x
]

{ #category : 'accessing' }
SpkVerticalTransform >> sOf: aPoint [

	"Answer the coordinate of aPoint on the secondary axis."

	^ aPoint x
]

{ #category : 'accessing' }
SpkVerticalTransform >> sResizingOf: aMorph [

	"Answer the resizing attribute of aMorph along my secondary axis"

	^ aMorph hResizing
]

{ #category : 'accessing' }
SpkVerticalTransform >> sStartOf: aRectangle [

	"Answer the starting coordinate on the secondary axis of a layout rectangle."

	^ aRectangle left
]
