"
A cell morph that can be enabled and disabled
"
Class {
	#name : 'SpkCellMorph',
	#superclass : 'FTSelectableMorph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Table'
}

{ #category : 'layout' }
SpkCellMorph >> assureLayoutProperties [

	| props |
	props := self layoutProperties.
	props == self ifTrue: [ props := nil ].
	(props isNil or: [ props includesTableProperties ]) ifTrue: [ 
		props := SpkLinearLayoutProperties new initializeFrom: self.
		self layoutProperties: props ].
	^ props
]

{ #category : 'accessing' }
SpkCellMorph >> clipSubmorphs [

	^ true
]

{ #category : 'initialization' }
SpkCellMorph >> initialize [

	super initialize.
	self layoutPolicy: SpkLinearLayoutPolicy new.
	self assureLayoutProperties coordinateTransform:
		SpkHorizontalTransform uniqueInstance
]
