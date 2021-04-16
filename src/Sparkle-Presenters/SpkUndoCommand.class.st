Class {
	#name : 'SpkUndoCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
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

{ #category : 'executing' }
SpkUndoCommand >> execute [

	self context undo
]
