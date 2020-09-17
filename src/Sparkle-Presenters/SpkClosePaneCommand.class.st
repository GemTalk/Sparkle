Class {
	#name : 'SpkClosePaneCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkClosePaneCommand class >> defaultIconName [

	^ #glamorousClose
]

{ #category : 'defaults' }
SpkClosePaneCommand class >> defaultName [

	^ 'Close pane'
]

{ #category : 'defaults' }
SpkClosePaneCommand class >> defaultShortcutKey [

	^ $w command mac 
		| $w control win 
		| $w control unix
]

{ #category : 'executing' }
SpkClosePaneCommand >> execute [

	self context closeRequestedLocally
]
