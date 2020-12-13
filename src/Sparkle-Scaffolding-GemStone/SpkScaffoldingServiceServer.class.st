Class {
	#name : 'SpkScaffoldingServiceServer',
	#superclass : 'SpkScaffoldingService',
	#instVars : [
		'doitException'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> debugService [
	^ remoteSelf debugService wait
]

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doit_01: aString [
	^ aString evaluate
]

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doit_02: aString [
	doitResult := aString evaluate
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doit_03: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openDebuggerOnClient: ex ]
]

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doitResult [
	^ doitResult
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openDebuggerOnClient [
	^ remoteSelf openDebuggerOnClient
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openDebuggerOnClient: ex [
	"at this point, just send a message to the client in the event of an error during doit execution"

	doitException := ex.
	^ self debugService openDebuggerOnClient wait
]
