"
A dummy action for tests that just knows whether it's been done or not.
Used by the UndoManagerTest.
"
Class {
	#name : 'SpkTestUndoableAction',
	#superclass : 'Object',
	#instVars : [
		'isDone'
	],
	#category : 'Sparkle-Test'
}

{ #category : 'initialization' }
SpkTestUndoableAction >> initialize [

	super initialize.
	isDone := false
]

{ #category : 'accessing' }
SpkTestUndoableAction >> isDone [

	^ isDone
]

{ #category : 'TOREMOVE' }
SpkTestUndoableAction >> performAction [

	isDone
		ifTrue: [ self error: 'Attempt to perform action already done' ]
		ifFalse: [ isDone := true ]
]

{ #category : 'TOREMOVE' }
SpkTestUndoableAction >> undoAction [

	isDone
		ifTrue: [ isDone := false ]
		ifFalse: [ self error: 'Attempt to undo action not done' ]
]
