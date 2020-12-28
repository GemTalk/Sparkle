Extension { #name : 'SpkScaffoldingAbstractService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingAbstractService >> debug: anException raisedDuring: aMessageSend answerUsing: aResolver [
	| type |
	type := UserGlobals at: #'ScaffoldingServiceServerDebugHandlerType'.
	type == #'remoteClientError'
		ifTrue: [ 
			" gsDebugger_05:"
			aResolver break: (RsrRemoteException from: anException) ]
		ifFalse: [ self pause	"suspend and open client debugger window" ]
]
