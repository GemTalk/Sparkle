Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingAbstractServiceClient',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_07: aString [
	^ remoteSelf gsDebugger_07: aString
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_07: aString usingDebugger: debuggerService [
	^ remoteSelf gsDebugger_07: aString usingDebugger: debuggerService
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_07: aString usingDebugger: debuggerService procName: procName [
	^ remoteSelf
		gsDebugger_07: aString
		usingDebugger: debuggerService
		procName: procName
]
