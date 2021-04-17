Class {
	#name : 'SpkDebugItCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkDebugItCommand class >> defaultIconName [

	^ #smallDebug
]

{ #category : 'defaults' }
SpkDebugItCommand class >> defaultName [

	^ 'Debug it'
]

{ #category : 'defaults' }
SpkDebugItCommand class >> defaultShortcutKey [

	^ $d shift command mac 
		| $d shift control win 
		| $d shift control unix
]

{ #category : 'executing' }
SpkDebugItCommand >> execute [

	self context debugIt
]
