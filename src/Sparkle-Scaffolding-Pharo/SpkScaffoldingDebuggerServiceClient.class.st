Class {
	#name : 'SpkScaffoldingDebuggerServiceClient',
	#superclass : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#instVars : [
		'debugger'
	],
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> clearDebugger [

	debugger := nil
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [

	| stack stackLimit |
	stackLimit := 50.
	stack := processService rowanFrameServices.
	debugger ifNil: [ debugger := (SparkyDebugger on: self) start ].
	debugger initializeFrameList.

	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) signal
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> resume [

	^ remoteSelf resume wait
]

{ #category : 'as yet unclassified' }
SpkScaffoldingDebuggerServiceClient >> stDisplayString [ 
	"sent by inspector (or debugger?) but the RSR service somehow
	tries to send it to the server and throws an error on the server
	and freezes Pharo."
	^'SpkScaffoldingDebuggerServiceClient>>stDisplayString was sent to the client' 
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> terminate [

	^ remoteSelf terminate
]
