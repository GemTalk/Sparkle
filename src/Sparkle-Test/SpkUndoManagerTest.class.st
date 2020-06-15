Class {
	#name : 'SpkUndoManagerTest',
	#superclass : 'TestCase',
	#instVars : [
		'manager'
	],
	#category : 'Sparkle-Test'
}

{ #category : 'running' }
SpkUndoManagerTest >> setUp [
	super setUp.
	manager := SpkUndoManager new
]

{ #category : 'tests' }
SpkUndoManagerTest >> testEmptyUndo [
	self
		deny: manager hasUndoableOperations;
		deny: manager hasRedoableOperations
]
