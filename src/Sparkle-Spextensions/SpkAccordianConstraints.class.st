"
Constraints class for SpkAccordianLayout. 

The constraint ""size"" is the number of pixels in the primary direction of the layout.
If given as a number, the size of the constrained presenter is fixed at that size in that direction.
If #variable, which is the default, the constrained pane presenter can be varied in size by the
layout's splitters.
"
Class {
	#name : 'SpkAccordianConstraints',
	#superclass : 'SpLayoutConstraints',
	#instVars : [
		'size'
	],
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'initialization' }
SpkAccordianConstraints >> initialize [

	super initialize.
	size := #variable
]

{ #category : 'accessing' }
SpkAccordianConstraints >> size [

	^ size
]

{ #category : 'accessing' }
SpkAccordianConstraints >> size: anObject [

	size := anObject
]

{ #category : 'testing' }
SpkAccordianConstraints >> sizeIsVariable [

	^ size == #variable
]
