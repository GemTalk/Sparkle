"
Abstract class for undoable/redoable actions

Public API and Key Messages

- performAction -- Do or redo myself
- undoAction -- Undo a performAction
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	tool:		<SpkToolWithUndoManager> The tool that created me, and upon which I act.
 

    Implementation Points
An Action is created by a Tool, and acts upon that Tool. Actions are expected to be coordinated by an UndoManager, which ensures that the performing and undoing of Actions happens in some sensible order.
"
Class {
	#name : 'SpkAction',
	#superclass : 'Object',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkAction class >> forTool: aTool [

	^ self new
		  tool: aTool;
		  yourself
]

{ #category : 'public' }
SpkAction >> performAction [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkAction >> tool: anObject [

	tool := anObject
]

{ #category : 'public' }
SpkAction >> undoAction [
	self subclassResponsibility 
]
