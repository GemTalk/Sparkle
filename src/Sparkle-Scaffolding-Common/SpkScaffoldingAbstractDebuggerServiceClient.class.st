Class {
	#name : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#superclass : 'SpkScaffoldingDebuggerService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> clearAllBreaks [
	"clear all breakpoints"

	^ remoteSelf clearAllBreaks wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> compileMethodSource: sourceString at: aLevel [
	(remoteSelf compileMethodSource: sourceString at: aLevel) wait.
	self openDebuggerOnClient
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> frameAt: aLevel [
	^ (remoteSelf frameAt: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> messageText [
	^ remoteSelf messageText wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> methodSourceAt: aLevel [
	^ (remoteSelf methodSourceAt: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> resumeWith: anObject [
	^ (remoteSelf resumeWith: anObject) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> rowanFrameServices [
	^ remoteSelf rowanFrameServices wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> setBreakpointForClass: className meta: isMeta selector: selector atStepPoint: stepPoint [
	"Set a breakpoint that will be signalled to the GCI.
		Returns true to indicate success.  Otherwise returns a string describing the error."

	| res |
	(res := (remoteSelf
		setBreakpointForClass: className
		meta: isMeta
		selector: selector
		atStepPoint: stepPoint) wait) == true
		ifFalse: [ self error: res ]
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> stepIntoFromLevel: aLevel [
	^ (remoteSelf stepIntoFromLevel: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> stepOutFromLevel: aLevel [
	^ (remoteSelf stepOutFromLevel: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> stepOverFromLevel: aLevel [
	^ (remoteSelf stepOverFromLevel: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> stepThroughFromLevel: aLevel [
	^ (remoteSelf stepThroughFromLevel: aLevel) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebuggerServiceClient >> trimStackToLevel: aLevel [
	(remoteSelf trimStackToLevel: aLevel) wait.
	self openDebuggerOnClient
]
