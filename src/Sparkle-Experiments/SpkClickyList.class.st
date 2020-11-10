Class {
	#name : 'SpkClickyList',
	#superclass : 'SpkMultiSelectList',
	#category : 'Sparkle-Experiments'
}

{ #category : 'as yet unclassified' }
SpkClickyList class >> withTestContents [
	^ self new
		addTestContents;
		yourself
]

{ #category : 'adding' }
SpkClickyList >> addTestContents [
	items addAll: #('First' 'Second' 'Third' 'Fourth')
]
