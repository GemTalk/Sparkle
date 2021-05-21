Class {
	#name : 'SpkScaffoldingProjectServiceServer',
	#superclass : 'SpkScaffoldingProjectService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'updating' }
SpkScaffoldingProjectServiceServer >> projectServiceNamed: projectName [
	rowanService := (RowanProjectService newNamed: projectName) asRSR
]
