Class {
	#name : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#superclass : 'SpkScaffoldingDebuggerService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> frameAt: aLevel [
	^ (remoteSelf frameAt: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> methodSourceAt: aLevel [
	^ (remoteSelf methodSourceAt: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> resumeWith: anObject [
	^ (remoteSelf resumeWith: anObject) wait
]
