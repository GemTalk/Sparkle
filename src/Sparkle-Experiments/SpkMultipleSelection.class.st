Class {
	#name : 'SpkMultipleSelection',
	#superclass : 'FTMultipleSelection',
	#category : 'Sparkle-Experiments'
}

{ #category : 'accessing' }
SpkMultipleSelection >> selectIndex: index event: event [
	^ self selectAppendingIndex: index
]
