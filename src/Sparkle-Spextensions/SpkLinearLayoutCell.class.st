Class {
	#name : 'SpkLinearLayoutCell',
	#superclass : 'SpkLayoutCell',
	#instVars : [
		'isSpaceFill'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout',
	#package : 'Sparkle-Spextensions',
	#tag : 'MorphicLayout'
}

{ #category : 'initialization' }
SpkLinearLayoutCell >> initialize [

	super initialize.
	isSpaceFill := false
]

{ #category : 'accessing' }
SpkLinearLayoutCell >> isSpaceFill [
	^ isSpaceFill
]

{ #category : 'accessing' }
SpkLinearLayoutCell >> isSpaceFill: anObject [
	isSpaceFill := anObject
]
