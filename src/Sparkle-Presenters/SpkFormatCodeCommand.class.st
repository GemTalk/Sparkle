Class {
	#name : 'SpkFormatCodeCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkFormatCodeCommand class >> defaultIconName [

	^ #'blank-16'
]

{ #category : 'defaults' }
SpkFormatCodeCommand class >> defaultName [

	^ 'Format'
]

{ #category : 'defaults' }
SpkFormatCodeCommand class >> defaultShortcutKey [

	^ $f command shift mac 
		| $f control shift win 
		| $f control shift unix
]

{ #category : 'executing' }
SpkFormatCodeCommand >> execute [

	self context formatCode
]
