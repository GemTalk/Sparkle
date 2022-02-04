Class {
	#name : 'SpkAtException',
	#superclass : 'SpkWhyStopped',
	#instVars : [
		'exception'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'instance creation' }
SpkAtException class >> for: anException [
	"I am abstract. Instantiate one of my subclasses."

	| exceptionClass |
	exceptionClass := anException class.
	exceptionClass == Breakpoint
		ifTrue: [ ^ SpkAtBreakpoint forException: anException ].
	exceptionClass == Halt
		ifTrue: [ ^ SpkAtHalt forException: anException ].
	^ SpkAtGenericException forException: anException
]

{ #category : 'instance creation' }
SpkAtException class >> forException: anException [
	^ self new
		exception: anException;
		yourself
]

{ #category : 'initializing' }
SpkAtException >> exception: anException [
	exception := anException
]
