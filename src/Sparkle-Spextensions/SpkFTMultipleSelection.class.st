Class {
	#name : 'SpkFTMultipleSelection',
	#superclass : 'FTMultipleSelectionStrategy',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'accessing' }
SpkFTMultipleSelection >> selectIndex: index event: event [
	^ self selectAppendingIndex: index
]
