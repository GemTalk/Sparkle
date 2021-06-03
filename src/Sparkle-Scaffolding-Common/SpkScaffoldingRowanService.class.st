Class {
	#name : 'SpkScaffoldingRowanService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'rsrRowanService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService [
	^ (self dynamicInstVarAt: #'rowanService')
		ifNil: [ self rowanService: self newRowanService ]
]

{ #category : 'accessing' }
SpkScaffoldingRowanService >> rowanService: anObject [
	^ self dynamicInstVarAt: #'rowanService' put: anObject
]
