Trait {
	#name : 'SpkTDebugLocalServer',
	#category : 'Sparkle-Services-PharoServer-Support'
}

{ #category : 'public-debugging' }
SpkTDebugLocalServer >> debug: anException raisedDuring: aMessageSend answerUsing: aResolver [

	^ anException raiseUnhandledError
]
