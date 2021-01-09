Class {
	#name : 'SpkScaffoldingDebuggerServiceClient',
	#superclass : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [

	self processService inspect
]
