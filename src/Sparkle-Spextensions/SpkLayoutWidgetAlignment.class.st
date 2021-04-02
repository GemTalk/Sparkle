"
Translates Spec-level alignments into Morphic cellPositioning constants.

Public API and Key Messages

- asMorphicCellPosition  Answers a symbol representing a selector to which Rectangle answers a point, such as #topCenter.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	hAlignment:		<Integer> 0 (left), 1 (center), 2 (right)
	vAlignment:		<Integer> 0 (top), 1 (center), 2 (bottom)

"
Class {
	#name : 'SpkLayoutWidgetAlignment',
	#superclass : 'Object',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'instance creation' }
SpkLayoutWidgetAlignment class >> new [ 

	self error: 'Use #uniqueInstance'
]

{ #category : 'instance creation' }
SpkLayoutWidgetAlignment class >> uniqueInstance [

	self = SpkLayoutWidgetAlignment ifTrue: [ 
		self error: 'I''m an abstract class. Use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : 'converting' }
SpkLayoutWidgetAlignment >> asMorphicAlign [

	self subclassResponsibility
]
