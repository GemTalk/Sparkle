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
		'minimumSize'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'instance creation' }
SpkLayoutCell class >> forMorph: aMorph [

	^ self new
		  targetMorph: aMorph;
		  yourself
]

{ #category : 'accessing' }
SpkLayoutCell >> beRigid [

	isRigid := true
]

{ #category : 'accessing' }
SpkLayoutCell >> beVariable [

	isRigid := false
]

{ #category : 'initialization' }
SpkLayoutCell >> initialize [

	super initialize.
	isRigid := false
]

{ #category : 'accessing' }
SpkLayoutCell >> isRigid [

	^ isRigid
]

{ #category : 'accessing' }
SpkLayoutCell >> minimumSize [
	^ minimumSize
]

{ #category : 'accessing' }
SpkLayoutCell >> minimumSize: aNumber [

	minimumSize := aNumber
]

{ #category : 'accessing' }
SpkLayoutCell >> targetMorph [
	^ targetMorph
]

{ #category : 'accessing' }
SpkLayoutCell >> targetMorph: anObject [
	targetMorph := anObject
]
