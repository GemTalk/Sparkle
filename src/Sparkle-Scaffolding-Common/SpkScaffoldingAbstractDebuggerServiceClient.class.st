Class {
	#name : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#superclass : 'SpkScaffoldingDebuggerService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> methodSourceAt: aLevel [
	^ (remoteSelf methodSourceAt: aLevel) wait
]
