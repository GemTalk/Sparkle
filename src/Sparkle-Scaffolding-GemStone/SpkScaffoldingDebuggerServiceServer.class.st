Class {
	#name : 'SpkScaffoldingDebuggerServiceServer',
	#superclass : 'SpkScaffoldingDebuggerService',
	#instVars : [
		'resumptionValue'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> clearAllBreaks [
	"clear all breakpoints set in image"

	GsNMethod clearAllBreaks.
	methodService
		ifNotNil: [ 
			methodService rowanMethodService update.
			methodService rowanMethodService: methodService rowanMethodService	"awkward but update the scaffolding method service this way for now" ]
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> compileMethodSource: sourceString at: aLevel [
	^ self processService compileMethodSource: sourceString at: aLevel
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> frameAt: aLevel [
	^ self rowanFrameServices at: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> messageText [
	^ self processService messageText
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> methodSourceAt: aLevel [
	^ (self rowanFrameServices at: aLevel) methodSource
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClient [
	^ remoteSelf openDebuggerOnClient wait
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> openDebuggerOnClientForProcess: aSuspendedGsProcess exception: ex [
	| res |
	self
		processService:
			((SpkScaffoldingDebugProcessServiceServer
				onSuspendedProcess: aSuspendedGsProcess)
				doitException: ex;
				debuggerService: self;
				yourself);
		synchronize.
	res := remoteSelf openDebuggerOnClient wait.
	^ res
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> resume [
	^ self processService resume
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> resumeWith: anObject [
	^ self processService resumeWith: anObject
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> resumptionValue [
	^ resumptionValue
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> resumptionValue: anObject [
	"Note that if nil is used, then the exception will resume with object that is on the top of the stack"

	resumptionValue := anObject
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> rowanFrameServices [
	^ self processService rowanFrameServices
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceServer >> setBreakpointForClass: className meta: isMeta selector: selector atStepPoint: stepPoint [
	"Set a breakpoint that will be signalled to the GCI.
		Returns true to indicate success.  Otherwise returns a string describing the error."

	| beh res |
	beh := Rowan globalNamed: className.
	isMeta
		ifTrue: [ beh := beh class ].
	res := beh
		_setMethodBreak: selector
		stepPoint: stepPoint
		env: 0
		breakpointLevel: 1.
	methodService
		ifNotNil: [ :methService | 
			methService rowanMethodService update.
			methService rowanMethodService: methService rowanMethodService	"awkward but update the scaffolding method service this way for now" ].

	^ res
]

{ #category : 'other' }
SpkScaffoldingDebuggerServiceServer >> stDisplayString [
	"sent by Pharo nspector (or debugger?) but the RSR service somehow
	tries to send it to the server and throws an error if this method is not present
	and freezes Pharo."

	^ 'SpkScaffoldingDebuggerServiceServer>>stDisplayString was sent to the server'
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> stepIntoFromLevel: aLevel [
	^ self processService stepIntoFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> stepOverFromLevel: aLevel [
	^ self processService stepOverFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> stepThroughFromLevel: aLevel [
	^ self processService stepThroughFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> terminate [
	^ self processService terminate
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceServer >> trimStackToLevel: aLevel [
	^ self processService trimStackToLevel: aLevel
]
