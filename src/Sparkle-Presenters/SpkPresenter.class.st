Class {
	#name : 'SpkPresenter',
	#superclass : 'SpPresenter',
	#category : 'Sparkle-Presenters'
}

{ #category : 'accessing' }
SpkPresenter >> iconNamed: aSymbol [
	^ self application iconNamed: aSymbol
]

{ #category : 'widgets' }
SpkPresenter >> newLabel [

	^ self instantiate: SpkLabelPresenter
]
