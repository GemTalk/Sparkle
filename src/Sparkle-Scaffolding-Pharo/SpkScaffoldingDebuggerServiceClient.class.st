Class {
	#name : 'SpkScaffoldingDebuggerServiceClient',
	#superclass : 'SpkScaffoldingAbstractDebuggerServiceClient',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'debugger' }
SpkScaffoldingDebuggerServiceClient >> openDebuggerOnClient [

	| stack stackLimit |
	stackLimit := 50.
	Transcript
		cr;
		show:
			'simulate opening debugger on process ('
			, processService printString , ') ... with stack: '.
	stack := processService rowanFrameServices.
	1 to: (stack size min: stackLimit) do: [ :index | 
		| frame |
		frame := stack at: index.
		Transcript
			cr;
			show: '  ' , index printString , '. ' , frame label ].
	stack size > stackLimit ifTrue: [ 
		Transcript
			cr;
			show:
				'... skipping remaining ' , (stack size - stackLimit) printString
				, ' frames' ].
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
