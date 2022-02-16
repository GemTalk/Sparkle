Class {
	#name : 'SpkWindowPresenter',
	#superclass : 'SpWindowPresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkWindowPresenter class >> adapterName [

	^#SpkWindowAdapter
]

{ #category : 'building menus' }
SpkWindowPresenter >> buildHamburgerMenu [

	^self presenter buildHamburgerMenu 
]

{ #category : 'accessing' }
SpkWindowPresenter >> iconNamed: aSymbol [
	^ self application iconNamed: aSymbol
]
