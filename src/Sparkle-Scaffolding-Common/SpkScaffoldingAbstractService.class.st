Class {
	#name : 'SpkScaffoldingAbstractService',
	#superclass : 'RsrService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'public-debugging' }
SpkScaffoldingAbstractService >> debug: anException
raisedDuring: aMessageSend
answerUsing: aResolver [

	aResolver break: (RsrRemoteException from: anException)
]
