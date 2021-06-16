Class {
	#name : 'SpkScaffoldingClassServiceServer',
	#superclass : 'SpkScaffoldingClassService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'initializing' }
SpkScaffoldingClassServiceServer >> initializeService [
	self rowanService: (self rowanService name: name) update
]

{ #category : 'accessing' }
SpkScaffoldingClassServiceServer >> rowanServiceClass [
	^ RowanClassService
]

{ #category : 'updating' }
SpkScaffoldingClassServiceServer >> update [
	self rowanService: self rowanService update
]
