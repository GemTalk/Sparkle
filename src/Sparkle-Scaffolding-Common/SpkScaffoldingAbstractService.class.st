Class {
	#name : 'SpkScaffoldingAbstractService',
	#superclass : 'RsrService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'public-debugging' }
SpkScaffoldingAbstractService >> debug: anException
raisedDuring: aMessageSend
answerUsing: aResolver [

	anException _signalToDebugger
]
