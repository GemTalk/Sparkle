Class {
	#name : 'SpkScaffoldingSoftBreakServiceServer',
	#superclass : 'SpkScaffoldingSoftBreakService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugging' }
SpkScaffoldingSoftBreakServiceServer >> softBreak [
	| allP proc |
	allP := (Processor allProcesses select: [ :aProc | aProc breakpointLevel >= 1 ])
		asArray.
	allP isEmpty
		ifTrue: [ 
			GsFile
				gciLogServer:
					'No eligible processes for soft break (ready status and breakpointLevel >= 1)'.
			Halt signalToGci.
			^ self ].
	proc := allP at: 1.
	GsFile gciLogServer: ' softBreak:  Break signalling to  ' , proc name.
	proc signalException: Break new.
	^ self
]
