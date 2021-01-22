Class {
	#name : 'SpkScaffoldingSoftBreakServiceServer',
	#superclass : 'SpkScaffoldingSoftBreakService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugging' }
SpkScaffoldingSoftBreakServiceServer >> softBreak [
	| allP |
	GsFile gciLogServer: 'SOFTBREAK---------------------------'.
	allP := ((Processor allProcesses
		select: [ :aProc | aProc _statusString = 'ready' and: [ aProc breakpointLevel >= 1 ] ])
		collect: [ :each | 
			GsFile gciLogServer: each _topazPrintName.
			each name -> each ]) asArray.
	GsFile gciLogServer: 'SOFTBREAK-->' , (allP at: 1) value _topazPrintName.
	allP isEmpty
		ifTrue: [ 
			GsFile
				gciLogServer:
					'No eligible processes for soft break (ready status and breakpointLevel >= 1)'.
			^ self ].
	(allP at: 1) value signalException: Break new.
	GsFile gciLogServer: 'SOFTBREAK---------------------------'.
	^ self
]
