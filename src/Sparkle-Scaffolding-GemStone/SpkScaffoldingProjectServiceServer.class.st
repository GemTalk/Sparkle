Class {
	#name : 'SpkScaffoldingProjectServiceServer',
	#superclass : 'SpkScaffoldingProjectService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'updating' }
SpkScaffoldingProjectServiceServer >> projectServiceNamed: projectName [
	rowanProjectService := (RowanProjectService newNamed: projectName) asRSR
]
