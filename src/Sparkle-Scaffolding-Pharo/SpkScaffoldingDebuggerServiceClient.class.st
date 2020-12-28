Class {
	#name : 'SpkScaffoldingDebuggerServiceClient',
	#superclass : 'SpkScaffoldingDebuggerService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [

	self processService inspect
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> resume [

	^ remoteSelf resume
]
