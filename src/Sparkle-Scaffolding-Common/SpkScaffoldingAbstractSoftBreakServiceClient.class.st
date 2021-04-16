Class {
	#name : 'SpkScaffoldingAbstractSoftBreakServiceClient',
	#superclass : 'SpkScaffoldingSoftBreakService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'debugging' }
SpkScaffoldingAbstractSoftBreakServiceClient >> softBreak [
GsFile gciLogServer: 'In softbreak client BEFORE softbreak; (priority = ', GsProcess _current priority printString, ')'.
	^ remoteSelf softBreak wait
]
