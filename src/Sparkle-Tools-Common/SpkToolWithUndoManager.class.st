Class {
	#name : 'SpkToolWithUndoManager',
	#superclass : 'SpkTool',
	#instVars : [
		'undoManager'
	],
	#category : 'Sparkle-Tools-Common',
	#package : 'Sparkle-Tools-Common'
}

{ #category : 'testing' }
SpkToolWithUndoManager >> canRedo [

	^ undoManager hasRedoableAction
]

{ #category : 'testing' }
SpkToolWithUndoManager >> canUndo [

	^ undoManager hasUndoableAction
]

{ #category : 'initialization' }
SpkToolWithUndoManager >> initialize [

	super initialize.
	undoManager := SpkUndoManager new
]

{ #category : 'accessing' }
SpkToolWithUndoManager >> performAction: anAction [

	undoManager performAction: anAction.
	self announceUpdate
]

{ #category : 'accessing' }
SpkToolWithUndoManager >> redo [

	self canRedo ifTrue: [ undoManager redo ].
	self announceUpdate
]

{ #category : 'accessing' }
SpkToolWithUndoManager >> redoActionName [
	"Answer the name of the next action that can be redone; nil if no such action"

	^ undoManager redoActionName
]

{ #category : 'accessing' }
SpkToolWithUndoManager >> undo [

	self canUndo ifTrue: [ undoManager undo ].
	self announceUpdate
]

{ #category : 'accessing' }
SpkToolWithUndoManager >> undoActionName [
	"Answer the name of the next action that can be redone; nil if no such action"

	^ undoManager undoActionName
]
