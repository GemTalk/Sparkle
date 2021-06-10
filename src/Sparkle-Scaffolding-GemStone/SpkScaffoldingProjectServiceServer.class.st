Class {
	#name : 'SpkScaffoldingProjectServiceServer',
	#superclass : 'SpkScaffoldingProjectService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'other' }
SpkScaffoldingProjectServiceServer >> initializeService [
	self rowanService: (self rowanService name: name) update
]

{ #category : 'other' }
SpkScaffoldingProjectServiceServer >> projectServiceNamed: projectName [
	self rowanService: (self rowanService name: projectName) update
]

{ #category : 'accessing' }
SpkScaffoldingProjectServiceServer >> rowanServiceClass [
	^ RowanProjectService
]

{ #category : 'other' }
SpkScaffoldingProjectServiceServer >> update [
	self rowanService: self rowanService update
]
