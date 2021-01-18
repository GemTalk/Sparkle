Class {
	#name : 'SpkScaffoldingDebuggerServiceClient',
	#superclass : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'simulation' }
SpkScaffoldingDebuggerServiceClient class >> debuggerSemaphore [
	^ SessionTemps current
		at: #'SpkScaffoldingSempahore'
		ifAbsentPut: [ Semaphore new ]
]

{ #category : 'simulation' }
SpkScaffoldingDebuggerServiceClient class >> resetDebuggerSemaphore [
	SessionTemps current removeKey: #'SpkScaffoldingSempahore' ifAbsent: [  ]
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> clearAllBreaks [
	"clear all breakpoints"

	^ remoteSelf clearAllBreaks wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> compileMethodSource: sourceString at: aLevel [
	self processService compileMethodSource: sourceString at: aLevel.
	self openDebuggerOnClient
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> messageText [
	^ self processService messageText
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [
	| stack stackLimit |
stackLimit := 50.
	GsFile
		gciLogServer:
			'simulate opening debugger on process (' , processService printString
				, ') ... with stack: '.
	stack := processService rowanFrameServices.
	1 to: (stack size min: stackLimit) do: [ :index | 
		| frame |
		frame := stack at: index.
		GsFile gciLogServer: '  ' , index printString , '. ' , frame label ].
	stack size > stackLimit
		ifTrue: [ 
			GsFile
				gciLogServer:
					'... skipping remaining ' , (stack size - stackLimit) printString , ' frames' ].
	GsFile
		gciLogServer:
			'process service oop (receiver of resume, terminate, etc.) '
				, processService asOop printString.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore signal
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> resume [
	^ self processService resume
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> resumeWith: anObject [
	^ self processService resumeWith: anObject
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> rowanFrameServices [
	^ self processService rowanFrameServices
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> setBreakpointForClass: className meta: isMeta selector: selector atStepPoint: stepPoint [
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
SpkScaffoldingDebuggerServiceClient >> stepOverFromLevel: aLevel [
	^ self processService stepOverFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> stepThroughFromLevel: aLevel [
	^ self processService stepThroughFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> terminate [
	^ self processService terminate
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> terminate9 [
	^ self processService terminate9
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> trimStackToLevel: aLevel [
	self processService trimStackToLevel: aLevel.
	self openDebuggerOnClient
]
