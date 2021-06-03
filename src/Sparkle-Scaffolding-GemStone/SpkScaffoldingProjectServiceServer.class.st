Class {
	#name : 'SpkScaffoldingProjectServiceServer',
	#superclass : 'SpkScaffoldingProjectService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'other' }
SpkScaffoldingProjectServiceServer >> projectServiceNamed: projectName [
	self rowanService: (RowanProjectService newNamed: projectName)
]
