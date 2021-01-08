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

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> messageText [
	^ self processService messageText
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [
	| stack |
	GsFile
		gciLogServer:
			'simulate opening debugger on process (' , processService printString
				, ') ... with stack: '.
	stack := processService rowanFrameServices.
	1 to: stack size do: [ :index | 
		| frame |
		frame := stack at: index.
		GsFile gciLogServer: '  ' , index printString , '. ' , frame label ].
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
SpkScaffoldingDebuggerServiceClient >> stepOverFromLevel: aLevel [
	^ self processService stepOverFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> terminate [
	^ self processService terminate
]
