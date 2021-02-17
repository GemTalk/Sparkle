Class {
	#name : 'SpkScaffoldingAbstractSoftBreakServiceClient',
	#superclass : 'SpkScaffoldingSoftBreakService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'debugging' }
SpkScaffoldingAbstractSoftBreakServiceClient >> softBreak [
	^ remoteSelf softBreak wait
]
