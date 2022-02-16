Trait {
	#name : 'SpkTWindowGrip',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'accessing' }
SpkTWindowGrip >> lock: aBoolean [

	"Refuse to lock, agree to unlock"

	aBoolean ifFalse: [ super lock: aBoolean ]
]

{ #category : 'event handling' }
SpkTWindowGrip >> mouseDown: anEvent [
	"Activate the window if not currently so."
	
	(self bounds containsPoint: anEvent cursorPoint)
		ifTrue: [self window ifNotNil: [:w | w activate]].
	^super mouseDown: anEvent
]
