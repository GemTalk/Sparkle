Class {
	#name : 'SpkFTMultipleSelection',
	#superclass : 'FTMultipleSelection',
	#category : 'Sparkle-Experiments'
}

{ #category : 'accessing' }
SpkFTMultipleSelection >> selectIndex: index event: event [
	^ self selectAppendingIndex: index
]
