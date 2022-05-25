"
Simpler version of SpBoxConstraints, for use by SpkBoxLayout.
Since SpkBoxLayouts allow insertion and removal of presenters at any index, 
constraints like #placedAtStart are not needed.
"
Class {
	#name : 'SpkBoxConstraints',
	#superclass : 'SpLayoutConstraints',
	#instVars : [
		'padding',
		'shouldFillWidth',
		'shouldFillHeight',
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

	shouldFillWidth := shouldFillHeight := aBoolean
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
SpkBoxConstraints >> padding [
	^ padding ifNil: [ padding := self class defaultPadding ]
]

{ #category : 'accessing' }
SpkBoxConstraints >> padding: aNumber [
	padding := aNumber
]

{ #category : 'accessing' }
SpkBoxConstraints >> shouldFillHeight [

	^ shouldFillHeight ifNil: [ 
		  shouldFillHeight := self class defaultFill ]
]

{ #category : 'accessing' }
SpkBoxConstraints >> shouldFillHeight: aBoolean [

	shouldFillHeight := aBoolean
]

{ #category : 'accessing' }
SpkBoxConstraints >> shouldFillWidth [

	^ shouldFillWidth ifNil: [ shouldFillWidth := self class defaultFill ]
]

{ #category : 'accessing' }
SpkBoxConstraints >> shouldFillWidth: aBoolean [

	shouldFillWidth := aBoolean
]

{ #category : 'accessing' }
SpkBoxConstraints >> width [
	^ width
]

{ #category : 'accessing' }
SpkBoxConstraints >> width: anObject [
	width := anObject
]
