Class {
	#name : 'SpkPresenterWithModel',
	#superclass : 'SpkPresenter',
	#instVars : [
		'model'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

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
SpkPresenterWithModel >> setModelBeforeInitialization: anObject [

	model := anObject
]
