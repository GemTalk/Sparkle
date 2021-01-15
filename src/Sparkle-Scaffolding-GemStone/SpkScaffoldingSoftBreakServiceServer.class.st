Class {
	#name : 'SpkScaffoldingSoftBreakServiceServer',
	#superclass : 'SpkScaffoldingSoftBreakService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'debugging' }
SpkScaffoldingSoftBreakServiceServer >> softBreak [
	| allP |
	allP := ((Processor allProcesses
		select: [ :aProc | aProc breakpointLevel >= 1 ])
		collect: [ :each | each name -> each ]) asArray.
	(allP at: 1) value signalException: Break new.
	^ self
]
