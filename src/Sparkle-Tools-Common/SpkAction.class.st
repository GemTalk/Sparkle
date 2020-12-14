"
Abstract class for undoable/redoable actions

Public API and Key Messages

- performAction -- Do or redo myself
- undoAction -- Undo a performAction
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	target:		<Object> The object upon which I act.
 

    Implementation Points
An Action is created by a Tool, and acts upon a target object designated by that Tool. Actions are expected to be coordinated by an UndoManager, which ensures that the performing and undoing of Actions happens in some sensible order.
"
Class {
	#name : 'SpkAction',
	#superclass : 'SpkObject',
	#instVars : [
		'target'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkAction class >> forTarget: targetObject [

	^ self new
		  target: targetObject;
		  yourself
]

{ #category : 'public' }
SpkAction >> performAction [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkAction >> target: anObject [

	target := anObject
]

{ #category : 'public' }
SpkAction >> undoAction [
	self subclassResponsibility 
]
