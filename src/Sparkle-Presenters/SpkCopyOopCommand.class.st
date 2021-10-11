Class {
	#name : 'SpkCopyOopCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkCopyOopCommand class >> defaultDescription [

	^'Put the inspected object''s oop on the clipboard as a hexadecimal string'
]

{ #category : 'default' }
SpkCopyOopCommand class >> defaultName [

	^ 'Copy OOP'
]

{ #category : 'executing' }
SpkCopyOopCommand >> execute [

	context copyOop
]
