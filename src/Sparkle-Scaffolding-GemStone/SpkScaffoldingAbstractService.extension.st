Extension { #name : 'SpkScaffoldingAbstractService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingAbstractService >> debug: anException
raisedDuring: aMessageSend
answerUsing: aResolver [

	aResolver break: (RsrRemoteException from: anException)
]
