Extension { #name : 'SpkScaffoldingAbstractService' }

{ #category : '*sparkle-scaffolding-gemstone-deprecated' }
SpkScaffoldingAbstractService >> debug: anException raisedDuring: aMessageSend answerUsing: aResolver [
	| type |
	type := UserGlobals
		at: #'ScaffoldingServiceServerDebugHandlerType'
		ifAbsent: [ #'remoteClientError' ].
	type ~~ #'remoteClientError'
		ifTrue: [ 
			" gsDebugger_05: and earlier"
			aResolver break: (RsrRemoteException from: anException) ]
		ifFalse: [ ^ anException _signalToDebugger ]
]
