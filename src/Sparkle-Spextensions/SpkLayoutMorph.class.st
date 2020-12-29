Class {
	#name : 'SpkLayoutMorph',
	#superclass : 'Morph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'layout' }
SpkLayoutMorph >> assureLayoutProperties [

	| props |
	props := self layoutProperties.
	props == self ifTrue: [ props := nil ].
	props ifNil: [ 
		props := SpkLinearLayoutProperties new initializeFrom: self.
		self layoutProperties: props ].
	^ props
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> cellInset: aNumber [

	"Layout specific. This property specifies an extra inset for each cell in the layout."

	self shouldNotImplement
]

{ #category : 'layout-properties' }
SpkLayoutMorph >> cellPositioning: aSymbol [

	"Layout specific. This property describes how the receiver should be layed out in its owner when the bounds of the cell assigned to the receiver do not exactly match its bounds. Possible values are:
		#topLeft, #topRight, #bottomLeft, #bottomRight, #topCenter, #leftCenter, #rightCenter, #bottomCenter, #center 
	which align the receiver's bounds with the cell at the given point."

	self assureLayoutProperties cellPositioning: aSymbol.
	self layoutChanged
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> cellSpacing: aSymbol [

	"Layout specific. This property describes how the cell size for each element in a list should be computed.
		#globalRect - globally equal rectangular cells
		#globalSquare - globally equal square cells
		#localRect - locally (e.g., per row/column) equal rectangular cells
		#localSquare - locally (e.g., per row/column) equal square cells
		#none - cells are sized based on available row/column constraints
	"

	self shouldNotImplement
]

{ #category : 'layout' }
SpkLayoutMorph >> changeLinearLayout [

	| layout |
	((layout := self layoutPolicy) notNil and: [ 
		 (layout respondsTo: #isLinearLayout) and: [ layout isLinearLayout ] ]) 
		ifTrue: [ ^ self ]. "already linear layout"
	self layoutPolicy: SpkLinearLayoutPolicy new.
	self layoutChanged
]

{ #category : 'accessing' }
SpkLayoutMorph >> coordinateTransform: xform [

	self assureLayoutProperties coordinateTransform: xform
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> layoutInset: aNumber [

	"Return the extra inset for layouts"

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> listCentering: aSymbol [

	"Layout specific. This property describes how the rows/columns in a list-like layout should be centered.
		#topLeft - center at start of primary direction
		#bottomRight - center at end of primary direction
		#center - center in the middle of primary direction
		#justified - insert extra space inbetween rows/columns
	"

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> listDirection: aSymbol [

	"Layout specific. This property describes the direction in which a list-like layout should be applied. Possible values are:
		#leftToRight
		#rightToLeft
		#topToBottom
		#bottomToTop
	indicating the direction in which any layout should take place"

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> listSpacing: aSymbol [

	"Layout specific. This property describes how the heights for different rows in a table layout should be handled.
		#equal - all rows have the same height
		#none - all rows may have different heights
	"

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> maxCellSize: aPoint [

	"Layout specific. This property specifies the maximum size of a table cell."

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> minCellSize: aPoint [

	"Layout specific. This property specifies the minimal size of a table cell."

	self shouldNotImplement
]

{ #category : 'layout-properties' }
SpkLayoutMorph >> primaryAlignmentClass: aClass [

	self assureLayoutProperties primaryAlignmentClass: aClass.
	self layoutChanged
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> reverseTableCells: aBool [

	"Layout specific. This property describes if the cells should be treated in reverse order of submorphs."

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> rubberBandCells: aBool [

	"Layout specific. This property describes if a parent that is #shrinkWrapped around its children should ignore any #spaceFill children. E.g., when #rubberBandCells is true, the compound layout will always stay at the smallest available size, even though some child may be able to grow."

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> wrapCentering: aSymbol [

	"Layout specific. This property describes how the rows/columns in a list-like layout should be centered.
		#topLeft - center at start of secondary direction
		#bottomRight - center at end of secondary direction
		#center - center in the middle of secondary direction
		#justified - insert extra space inbetween rows/columns
	"

	self shouldNotImplement
]

{ #category : 'bogus properties' }
SpkLayoutMorph >> wrapDirection: aSymbol [

	"Layout specific. This property describes the direction along which a list-like layout should be wrapped. Possible values are:
		#leftToRight
		#rightToLeft
		#topToBottom
		#bottomToTop
		#none
	indicating in which direction wrapping should occur. This direction must be orthogonal to the list direction, that is if listDirection is #leftToRight or #rightToLeft then wrapDirection must be #topToBottom or #bottomToTop and vice versa."

	self shouldNotImplement
]
