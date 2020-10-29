"
My primary axis is horizontal (x), secondary is vertical (y).
"
Class {
	#name : 'SpkHorizontalTransform',
	#superclass : 'SpkCoordinateTransform',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'accessing' }
SpkHorizontalTransform >> pEndOf: aRectangle [

	"Answer the ending coordinate on the primary axis of a layout rectangle."

	^ aRectangle right
]

{ #category : 'accessing' }
SpkHorizontalTransform >> pMinimumSizeOf: aMorph [

	"What is the minimum size along the primary axis to display aMorph?"

	^ aMorph minExtent x
]

{ #category : 'accessing' }
SpkHorizontalTransform >> pOf: aPoint [

	"Answer the coordinate of aPoint on the primary axis."

	^ aPoint x
]

{ #category : 'accessing' }
SpkHorizontalTransform >> pResizingOf: aMorph [

	"Answer the resizing attribute of aMorph along my primary axis"

	^ aMorph hResizing
]

{ #category : 'accessing' }
SpkHorizontalTransform >> pStartOf: aRectangle [

	"Answer the starting coordinate on the primary axis of a layout rectangle."

	^ aRectangle left
]

{ #category : 'accessing' }
SpkHorizontalTransform >> rectanglePStart: pStart pEnd: pEnd sStart: sStart sEnd: sEnd [

	"Answer a rectangle in x-y coordinates having the given four sides in p-s coordinates."

	^ Rectangle
		  left: pStart
		  right: pEnd
		  top: sStart
		  bottom: sEnd
]

{ #category : 'accessing' }
SpkHorizontalTransform >> sEndOf: aRectangle [

	"Answer the ending coordinate on the secondary axis of a layout rectangle."

	^ aRectangle bottom
]

{ #category : 'accessing' }
SpkHorizontalTransform >> sStartOf: aRectangle [

	"Answer the starting coordinate on the secondary axis of a layout rectangle."

	^ aRectangle top
]
