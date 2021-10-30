Class {
	#name : 'SpkAccordianLayoutMorph',
	#superclass : 'SpkLayoutMorph',
	#instVars : [
		'priorities'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'layout' }
SpkAccordianLayoutMorph >> assureLayoutProperties [

	| props |
	props := self layoutProperties.
	props == self ifTrue: [ props := nil ].
	props ifNil: [ 
		props := SpkLinearLayoutProperties new initializeFrom: self.
		self layoutProperties: props ].
	^ props
]

{ #category : 'accessing' }
SpkAccordianLayoutMorph >> coordinateTransform [

	^ self assureLayoutProperties coordinateTransform
]

{ #category : 'initialization' }
SpkAccordianLayoutMorph >> initialize [

	super initialize.
	priorities := IdentityDictionary new
]

{ #category : 'accessing' }
SpkAccordianLayoutMorph >> priorityOf: aSubmorph [

	^ priorities at: aSubmorph ifAbsentPut: [ 1.0 ]
]

{ #category : 'accessing' }
SpkAccordianLayoutMorph >> setPriorityOf: aSubmorph to: aNumber [

	priorities at: aSubmorph put: aNumber
]
