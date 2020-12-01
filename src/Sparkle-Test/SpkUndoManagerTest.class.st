Class {
	#name : 'SpkUndoManagerTest',
	#superclass : 'TestCase',
	#instVars : [
		'manager'
	],
	#category : 'Sparkle-Test'
}

{ #category : 'support' }
SpkUndoManagerTest >> newAction [

	^ SpkTestUndoableAction new
]

{ #category : 'running' }
SpkUndoManagerTest >> setUp [

	super setUp.
	manager := SpkUndoManager withLimit: 2
]

{ #category : 'tests' }
SpkUndoManagerTest >> testEmptyUndo [

	self
		deny: manager hasUndoableAction;
		deny: manager hasRedoableAction
]

{ #category : 'tests' }
SpkUndoManagerTest >> testIndecision [

	| action |
	action := self newAction.
	manager performAction: action.
	manager
		undo;
		redo;
		undo;
		redo.
	self
		assert: action isDone;
		assert: manager hasUndoableAction;
		deny: manager hasRedoableAction.
	manager undo.
	self
		deny: action isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction
]

{ #category : 'tests' }
SpkUndoManagerTest >> testRedoUnderflow [

	| actions action1 action2 action3 |
	actions := { 
		           (action1 := self newAction).
		           (action2 := self newAction).
		           (action3 := self newAction) }.
	actions do: [ :action | manager performAction: action ].
	manager
		undo;
		undo;
		redo;
		redo.

	self deny: manager hasRedoableAction.
	self should: [ manager redo ] raise: Error
]

{ #category : 'tests' }
SpkUndoManagerTest >> testSingleRedo [

	| action |
	action := self newAction.
	manager performAction: action.
	manager undo.
	self
		deny: action isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction.
	manager redo.
	self
		assert: action isDone;
		assert: manager hasUndoableAction;
		deny: manager hasRedoableAction
]

{ #category : 'tests' }
SpkUndoManagerTest >> testSingleUndo [

	| action |
	action := self newAction.
	self
		deny: manager hasUndoableAction;
		deny: manager hasRedoableAction;
		deny: action isDone.
	manager performAction: action.
	self
		assert: action isDone;
		assert: manager hasUndoableAction;
		deny: manager hasRedoableAction.
	manager undo.
	self
		deny: action isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction
]

{ #category : 'tests' }
SpkUndoManagerTest >> testUndoOverflow [

	| actions action1 action2 action3 |
	actions := { 
		           (action1 := self newAction).
		           (action2 := self newAction).
		           (action3 := self newAction) }.
	actions do: [ :action | manager performAction: action ].
	actions do: [ :action | self assert: action isDone ].

	manager
		undo;
		redo;
		undo;
		undo.

	self
		assert: action1 isDone;
		deny: action2 isDone;
		deny: action3 isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction
]

{ #category : 'tests' }
SpkUndoManagerTest >> testUndoUnderflow [

	| actions action1 action2 action3 |
	actions := { 
		           (action1 := self newAction).
		           (action2 := self newAction).
		           (action3 := self newAction) }.
	actions do: [ :action | manager performAction: action ].
	manager
		undo;
		redo;
		undo;
		undo.

	self deny: manager hasUndoableAction.
	self should: [ manager undo ] raise: Error
]
