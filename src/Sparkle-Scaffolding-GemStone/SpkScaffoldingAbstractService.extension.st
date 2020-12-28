Extension { #name : 'SpkScaffoldingAbstractService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingAbstractService >> debug: anException raisedDuring: aMessageSend answerUsing: aResolver [
	| type |
	type := UserGlobals
		at: #'ScaffoldingServiceServerDebugHandlerType'
		ifAbsent: [ #'remoteClientError' ].
	type == #'remoteClientError'
		ifTrue: [ 
			" gsDebugger_05: and earlier"
			aResolver break: (RsrRemoteException from: anException) ]
		ifFalse: [ 
			| mon debugProcess |
			"suspend and open client debugger window"
			debugProcess := GsProcess _current.
			mon := [ 
			GsProcess _current debugActionBlock: nil.	"any errors at this point should go straight to GCI"
			SpkScaffoldingDebuggerServiceServer new
				registerWith: self connection;
				openDebuggerOnClientForProcess: debugProcess exception: anException;
				yourself ] forkAt: Processor userInterruptPriority.	"methinks this process should have a nil debugActionBlock"
			debugProcess suspend.
			self pause	"what do we have here?" ]
]
