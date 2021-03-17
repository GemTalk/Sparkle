"
I cache information about a submorph to be used by SpkLinearLayout.

Internal Representation and Key Implementation Points.

    Instance Variables
-	isSpaceFill:		<Boolean>
-	minimumWidth:		<Number>


    Implementation Points
"
Class {
	#name : 'SpkLayoutCell',
	#superclass : 'Object',
	#instVars : [
		'targetMorph',
		'isRigid',
		'isSpaceFill',
		'pMinimumSize'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'instance creation' }
SpkLayoutCell class >> forMorph: aMorph [

	^ self new
		  targetMorph: aMorph;
		  yourself
]

{ #category : 'initialization' }
SpkLayoutCell >> initialize [

	super initialize.
	isSpaceFill := isRigid := false
]

{ #category : 'accessing' }
SpkLayoutCell >> isRigid [

	^ isRigid
]

{ #category : 'accessing' }
SpkLayoutCell >> isRigid: anObject [

	isRigid := anObject
]

{ #category : 'accessing' }
SpkLayoutCell >> isSpaceFill [
	^ isSpaceFill
]

{ #category : 'accessing' }
SpkLayoutCell >> isSpaceFill: anObject [
	isSpaceFill := anObject
]

{ #category : 'accessing' }
SpkLayoutCell >> pMinimumSize [
	^ pMinimumSize
]

{ #category : 'accessing' }
SpkLayoutCell >> pMinimumSize: aNumber [

	pMinimumSize := aNumber
]

{ #category : 'accessing' }
SpkLayoutCell >> targetMorph [
	^ targetMorph
]

{ #category : 'accessing' }
SpkLayoutCell >> targetMorph: anObject [
	targetMorph := anObject
]
