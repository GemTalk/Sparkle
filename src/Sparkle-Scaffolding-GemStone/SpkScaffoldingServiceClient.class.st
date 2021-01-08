Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingAbstractServiceClient',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> gsDebugger_07: aString usingDebugger: debuggerService [

	^ remoteSelf gsDebugger_07: aString usingDebugger: debuggerService
]
