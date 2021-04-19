Class {
	#name : 'SpkRedoCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkRedoCommand class >> defaultIconName [

	^ #glamorousRedo
]

{ #category : 'default' }
SpkRedoCommand class >> defaultName [

	^ 'Redo'
]

{ #category : 'defaults' }
SpkRedoCommand class >> defaultShortcutKey [

	^ $z command shift mac 
		| $z control shift win 
		| $z control shift unix
]

{ #category : 'executing' }
SpkRedoCommand >> execute [

	self context redo
]
