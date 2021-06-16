Class {
	#name : 'SpkScaffoldingPackageServiceServer',
	#superclass : 'SpkScaffoldingPackageService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'initialization' }
SpkScaffoldingPackageServiceServer >> initializeService [
	self rowanService: (self rowanService name: name) update
]

{ #category : 'accessing' }
SpkScaffoldingPackageServiceServer >> rowanServiceClass [
	^ RowanPackageService
]

{ #category : 'updating' }
SpkScaffoldingPackageServiceServer >> update [
	self rowanService: self rowanService update
]
