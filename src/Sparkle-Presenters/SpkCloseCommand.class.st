Class {
	#name : 'SpkCloseCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands',
	#package : 'Sparkle-Presenters',
	#tag : 'Commands'
}

{ #category : 'defaults' }
SpkCloseCommand class >> defaultIconName [

	^ #glamorousClose
]

{ #category : 'defaults' }
SpkCloseCommand class >> defaultShortcutKey [

	^ $w command mac 
		| $w control win 
		| $w control unix
]

{ #category : 'executing' }
SpkCloseCommand >> execute [

	self context closeRequestedLocally
]
