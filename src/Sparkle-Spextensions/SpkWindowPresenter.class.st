Class {
	#name : 'SpkWindowPresenter',
	#superclass : 'SpWindowPresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkWindowPresenter class >> adapterName [

	^#SpkWindowAdapter
]

{ #category : 'accessing' }
SpkWindowPresenter >> iconNamed: aSymbol [
	^ self application iconNamed: aSymbol
]
