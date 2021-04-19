Class {
	#name : 'SpkPresenterWithModel',
	#superclass : 'SpkPresenter',
	#instVars : [
		'model'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkPresenterWithModel >> model [
	^ model
]

{ #category : 'accessing' }
SpkPresenterWithModel >> setModelBeforeInitialization: anObject [

	model := anObject
]
