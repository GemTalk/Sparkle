"
For SpkBoxLayouts at the Spec level. More control than LayoutProperties, but a lot simpler than TableLayoutProperties.

    Instance Variables
	directionClass:			<SpkCoordinateWrapper class> 
	primaryAlignment:		<SpkPrimaryDirectionAlignment>
	secondaryAlignment:	<SpkSecondaryDirectionAlignment>


    Implementation Points

	directionClass is either SpkHorizontalCoordinateWrapper or SpkVerticalCoordinateWrapper. Instances of this class are used to transform between the primary, secondary coordinate system (p, s) coordinates of the layout and the cartesian (x y) coordinates of the Morphs.

	primaryAlignment is an object that computes cell bounds for each submorph. Its class varies with what alignment has been specified (begin, end, center, justify)
	
	secondaryAlignment is an object that knows what symbol to answer to #cellPositioning. Those symbols are all selectors understood by Rectangle. They are either:
  For a layout with a horizontal primary direction
- #topCenter
- #bottomCenter
- #center

  For a layout with a vertical primary direction
- #leftCenter
- #rightCenter
- #center

"
Class {
	#name : 'SpkLinearLayoutProperties',
	#superclass : 'LayoutProperties',
	#instVars : [
		'coordinateTransform',
		'primaryAlignmentClass',
		'cellPositioning'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'accessing' }
SpkLinearLayoutProperties >> cellPositioning [

	^ cellPositioning
]

{ #category : 'accessing' }
SpkLinearLayoutProperties >> cellPositioning: anObject [
	cellPositioning := anObject
]

{ #category : 'accessing' }
SpkLinearLayoutProperties >> coordinateTransform [
	^ coordinateTransform
]

{ #category : 'accessing' }
SpkLinearLayoutProperties >> coordinateTransform: anObject [
	coordinateTransform := anObject
]

{ #category : 'initialization' }
SpkLinearLayoutProperties >> initialize [

	super initialize.
	primaryAlignmentClass := SpkLinearLayoutAlignStart.
	cellPositioning := #center
]

{ #category : 'accessing' }
SpkLinearLayoutProperties >> primaryAlignmentClass [
	^ primaryAlignmentClass
]

{ #category : 'accessing' }
SpkLinearLayoutProperties >> primaryAlignmentClass: anObject [
	primaryAlignmentClass := anObject
]
