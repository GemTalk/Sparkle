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
	#category : 'Sparkle-Tools-Common-Test'
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

{ #category : 'public' }
SpkTestUndoableAction >> performAction [

	isDone
		ifTrue: [ self error: 'Attempt to perform action already done' ]
		ifFalse: [ isDone := true ].
	^ 42
]

{ #category : 'TOREMOVE' }
SpkTestUndoableAction >> undoAction [

	isDone
		ifTrue: [ isDone := false ]
		ifFalse: [ self error: 'Attempt to undo action not done' ]
]
