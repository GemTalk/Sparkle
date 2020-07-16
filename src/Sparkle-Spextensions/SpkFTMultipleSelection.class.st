Class {
	#name : 'SpkFTMultipleSelection',
	#superclass : 'FTMultipleSelection',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'accessing' }
SpkFTMultipleSelection >> selectIndex: index event: event [
	^ self selectAppendingIndex: index
]
