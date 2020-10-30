Class {
	#name : 'SpkBoxConstraints',
	#superclass : 'SpLayoutConstraints',
	#instVars : [
		'padding',
		'fill',
		'width',
		'height'
	],
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'defaults' }
SpkBoxConstraints class >> defaultFill [

	^ true
]

{ #category : 'initialization' }
SpkBoxConstraints class >> defaultPadding [

	^ 0
]

{ #category : 'accessing' }
SpkBoxConstraints >> fill: aBoolean [

	fill := aBoolean
]

{ #category : 'accessing' }
SpkBoxConstraints >> height [
	^ height
]

{ #category : 'accessing' }
SpkBoxConstraints >> height: anObject [
	height := anObject
]

{ #category : 'accessing' }
SpkBoxConstraints >> isFill [

	^ fill ifNil: [ fill := self class defaultFill ]
]

{ #category : 'accessing' }
SpkBoxConstraints >> padding [
	^ padding ifNil: [ padding := self class defaultPadding ]
]

{ #category : 'accessing' }
SpkBoxConstraints >> padding: anObject [
	padding := anObject
]

{ #category : 'accessing' }
SpkBoxConstraints >> width [
	^ width
]

{ #category : 'accessing' }
SpkBoxConstraints >> width: anObject [
	width := anObject
]
