Class {
	#name : 'SpkScaffoldingDebuggerServiceClient',
	#superclass : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#instVars : [
		'debugger'
	],
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> clearDebugger [

	debugger := nil
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [

	| stack stackLimit |
	stackLimit := 50.
	"Transcript
		cr;
		show: 'show stacks on process (' , processService printString
			, ') ... stack: '."
	stack := processService rowanFrameServices.
	debugger ifNil: [ 
	debugger := (SparkleTraditionalDebugger on: self) start].
	debugger initializeFrameList.
	"1 to: (stack size min: stackLimit) do: [ :index | 
		| frame |
		frame := stack at: index.
		Transcript
			cr;
			show: '  ' , index printString , '. ' , frame label ]."
	"stack size > stackLimit ifTrue: [ 
		Transcript
			cr;
			show:
				'... skipping remaining ' , (stack size - stackLimit) printString
				, ' frames' ]."
	(Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE) signal
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> resume [

	^ remoteSelf resume wait
]

{ #category : 'as yet unclassified' }
SpkScaffoldingDebuggerServiceClient >> stDisplayString [ 
	"sent by inspector (or debugger?) but the RSR service somehow
	tries to send it to the server and throws an error on the server
	and freezes Pharo."
	^'SpkScaffoldingDebuggerServiceClient>>stDisplayString was sent to the client' 
]

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> terminate [

	^ remoteSelf terminate
]
