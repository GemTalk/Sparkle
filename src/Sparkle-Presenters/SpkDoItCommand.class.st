Class {
	#name : 'SpkDoItCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkDoItCommand class >> defaultIconName [

	^ #smallDoIt
]

{ #category : 'defaults' }
SpkDoItCommand class >> defaultName [

	^ 'Do it'
]

{ #category : 'defaults' }
SpkDoItCommand class >> defaultShortcutKey [

	^ $d command mac 
		| $d control win 
		| $d control unix
]

{ #category : 'executing' }
SpkDoItCommand >> execute [

	self context doIt
]
