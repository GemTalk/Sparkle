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
		do: [ :ex | self openInspectorOnClient: ex ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doit_04: aString [
	doitResult := [ aString evaluate ]
		on: Error
		do: [ :ex | self openDebuggerOnClient: ex ]
]

{ #category : 'accessing' }
SpkScaffoldingServiceServer >> doitException [
	^doitException
]

{ #category : 'accessing' }
SpkScaffoldingServiceServer >> doitException: object [
	doitException := object
]

{ #category : 'doits' }
SpkScaffoldingServiceServer >> doitResult [
	^ doitResult
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> doitStack [
	^ doitStack ifNil: [ 'no stack available' ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openDebuggerOnClient [
	^ remoteSelf openDebuggerOnClient
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openDebuggerOnClient: ex [
	"at this point, just send a message to the client in the event of an error during doit execution"

	self debugService
		doitException: ex;
		doitStack: (GsProcess stackReportToLevel: 1000).
	^ self debugService openDebuggerOnClient wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openInspectorOnClient [
	^ remoteSelf openInspectorOnClient
]

{ #category : 'debugger' }
SpkScaffoldingServiceServer >> openInspectorOnClient: ex [
	"at this point, just send a message to the client in the event of an error during doit execution"

	doitException := ex.
	^ self debugService openInspectorOnClient wait
]

{ #category : 'other' }
SpkScaffoldingServiceServer >> processList [
	^ processList
		ifNil: [ 
			processList := Dictionary new.
			Processor allProcesses
				do: [ :gsProcess | 
					processList
						at: gsProcess asOop
						put: (gsProcess _gsiStackReportFromLevel: 1 toLevel: 1000) ] ]
]
