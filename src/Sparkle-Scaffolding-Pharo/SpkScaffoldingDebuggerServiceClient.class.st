Class {
	#name : 'SpkScaffoldingDebuggerServiceClient',
	#superclass : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#instVars : [
		'debugger'
	],
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [

	| stack stackLimit |
	stackLimit := 50.
	stack := processService rowanFrameServices.
	debugger ifNil:[debugger := 
	(SparkleTraditionalDebugger on: self) start].
	debugger initializeFrameList.
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) signal
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> resume [

	^ remoteSelf resume wait
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> terminate [

	^ remoteSelf terminate
]
