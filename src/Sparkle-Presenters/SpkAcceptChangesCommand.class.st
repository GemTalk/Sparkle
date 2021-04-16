Class {
	#name : 'SpkAcceptChangesCommand',
	#superclass : 'SpAcceptChangesCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkAcceptChangesCommand class >> defaultShortcutKey [

	^ $s command mac 
		| $s control win 
		| $s control unix
]
