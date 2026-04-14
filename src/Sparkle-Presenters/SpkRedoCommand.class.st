Class {
	#name : 'SpkRedoCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkRedoCommand class >> defaultIconName [

	^ #glamorousRedo
]

{ #category : 'defaults' }
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

{ #category : 'accessing' }
SpkRedoCommand >> name [

	^ context redoMenuItemName
]
