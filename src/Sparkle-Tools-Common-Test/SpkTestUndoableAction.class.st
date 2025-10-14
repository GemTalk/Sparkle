"
A dummy action for tests that just knows whether it's been done or not.
Used by the UndoManagerTest.
"
Class {
	#name : 'SpkTestUndoableAction',
	#superclass : 'SpkAction',
	#instVars : [
		'value',
		'isDone',
		'isDiscarded'
	],
	#category : 'Sparkle-Tools-Common-Test',
	#package : 'Sparkle-Tools-Common-Test'
}

{ #category : 'instance creation' }
SpkTestUndoableAction class >> withValue: anObject [

	^ self new
		  value: anObject;
		  yourself
]

{ #category : 'public' }
SpkTestUndoableAction >> discardAction [

	isDiscarded := true
]

{ #category : 'initialization' }
SpkTestUndoableAction >> initialize [

	super initialize.
	isDone := isDiscarded := false
]

{ #category : 'accessing' }
SpkTestUndoableAction >> isDiscarded [

	^ isDiscarded
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

{ #category : 'public' }
SpkTestUndoableAction >> undoAction [

	isDone
		ifTrue: [ isDone := false ]
		ifFalse: [ self error: 'Attempt to undo action not done' ]
]

{ #category : 'accessing' }
SpkTestUndoableAction >> value [

	^ value
]

{ #category : 'accessing' }
SpkTestUndoableAction >> value: anObject [

	value := anObject
]
