Class {
	#name : 'SpkCancelChangesCommand',
	#superclass : 'SpCancelChangesCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkCancelChangesCommand class >> defaultShortcutKey [

	^ $l command mac 
		| $l control win 
		| $l control unix
]
