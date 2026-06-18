Class {
	#name : 'SpkUndoCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkUndoCommand class >> defaultIconName [

	^ #glamorousUndo
]

{ #category : 'defaults' }
SpkUndoCommand class >> defaultName [

	^ 'Undo'
]

{ #category : 'defaults' }
SpkUndoCommand class >> defaultShortcutKey [

	^ $z command mac 
		| $z control win 
		| $z control unix
]

{ #category : 'accessing' }
SpkUndoCommand >> description [

	^ 'Undo the most recent action'
]

{ #category : 'executing' }
SpkUndoCommand >> execute [

	self context undo
]

{ #category : 'accessing' }
SpkUndoCommand >> name [
	^ context undoMenuItemName
]
