Class {
	#name : 'SpkScaffoldingProjectServiceServer',
	#superclass : 'SpkScaffoldingProjectService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'other' }
SpkScaffoldingProjectServiceServer >> projectServiceNamed: projectName [
	self rowanService: (self rowanService name: projectName) update
]

{ #category : 'accessing' }
SpkScaffoldingProjectServiceServer >> rowanServiceClass [
	^ RowanProjectService
]
