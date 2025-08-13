Class {
	#name : 'SpkCancelChangesCommand',
	#superclass : 'SpCancelChangesCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkCancelChangesCommand class >> defaultShortcutKey [

	^ $l command mac 
		| $l control win 
		| $l control unix
]
