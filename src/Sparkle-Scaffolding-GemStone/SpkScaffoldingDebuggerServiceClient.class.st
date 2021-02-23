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
SpkScaffoldingDebuggerServiceClient >> compileMethodSource: sourceString at: aLevel [
	self processService compileMethodSource: sourceString at: aLevel.
	self openDebuggerOnClient
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
	^ remoteSelf resume wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> rowanFrameServices [
	^ self processService rowanFrameServices
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebuggerServiceClient >> terminate [
	^ remoteSelf terminate wait
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
