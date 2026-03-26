"
Controls undo/redo for a Tool.

Public API and Key Messages

- create instances by sending #withLimit: 
- hasUndoableAction -- true if undo stack not empty
- hasRedoableAction -- true if the redo stack not empty
- performAction: anAction -- perform the action and push it on the undo stack.
- undo -- pop an action from the undo stack, undo it, and push it on the redo stack. 
- redo -- pop an action from the redo stack, perform it, and push it on the undo stack.

if hasRedoableAction, redo the action on top of the redo stack and push it on
   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    **Instance Variables**
-	redo:		<SpkSmallStack> Actions that have been undone and are available to be redone
-	undo:		<SpkSmallStack> Actions that have been done or redone and are available to be undone


    Implementation Points
"
Class {
	#name : 'SpkUndoManager',
	#superclass : 'SpkObject',
	#instVars : [
		'undo',
		'redo'
	],
	#category : 'Sparkle-Tools-Common',
	#package : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkUndoManager class >> withLimit: anInteger [

	^ self new
		  limit: anInteger;
		  yourself
]

{ #category : 'testing' }
SpkUndoManager >> hasRedoableAction [

	^ redo isNotEmpty
]

{ #category : 'testing' }
SpkUndoManager >> hasUndoableAction [

	^ undo isNotEmpty
]

{ #category : 'initialization' }
SpkUndoManager >> initialize [

	super initialize.
	undo := SpkActionStack new.
	redo := SpkActionStack new
]

{ #category : 'accessing' }
SpkUndoManager >> limit: anInteger [

	undo limit: anInteger.
	redo limit: anInteger
]

{ #category : 'accessing' }
SpkUndoManager >> performAction: anAction [

	| result |
	result := anAction performAction.
	redo clear.
	undo push: anAction.
	^ result
]

{ #category : 'accessing' }
SpkUndoManager >> redo [

	| action result |
	action := redo pop.
	result := action performAction.
	undo push: action.
	^ result
]

{ #category : 'accessing' }
SpkUndoManager >> redoActionName [
	"Answer the name of the next action that can be redone; nil if no such action"

	^ redo topName
]

{ #category : 'accessing' }
SpkUndoManager >> undo [

	| action |
	action := undo pop.
	action undoAction.
	redo push: action.
	^ nil "Nil to cause an error if someone mistakenly tries to use the result."
]

{ #category : 'accessing' }
SpkUndoManager >> undoActionName [
	"Answer the name of the next action that can be redone; nil if no such action"

	^ undo topName
]
