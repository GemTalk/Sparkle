Class {
	#name : 'SpkPresenterWithModel',
	#superclass : 'SpkPresenter',
	#traits : 'SpkTPresenterWithModel',
	#classTraits : 'SpkTPresenterWithModel classTrait',
	#instVars : [
		'model'
	],
	#category : 'Sparkle-Presenters-Presenters',
	#package : 'Sparkle-Presenters',
	#tag : 'Presenters'
}

{ #category : 'enumerating' }
SpkPresenterWithModel >> childrenDo: aBlock [
	"By default, do nothing.
	Subclasses presenters that have a notion of child presenters should override this method."

	
]

{ #category : 'accessing' }
SpkPresenterWithModel >> explorer [

	| presenter |
	presenter := self.

	[ presenter isExplorer ifTrue: [ ^ presenter ].
		presenter := presenter owner.
		presenter notNil ] whileTrue.
	self error: 'Expected an explorer ancestor'
]

{ #category : 'accessing' }
SpkPresenterWithModel >> explorerService [

	^ self explorer model
]

{ #category : 'accessing' }
SpkPresenterWithModel >> model [
	^ model
]

{ #category : 'accessing' }
SpkPresenterWithModel >> model: aService [

	model := aService
]

{ #category : 'accessing' }
SpkPresenterWithModel >> modelClass [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkPresenterWithModel >> setModelBeforeInitialization: anObject [

	model := anObject
]
