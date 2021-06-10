Class {
	#name : 'SpkScaffoldingBrowserServiceServer',
	#superclass : 'SpkScaffoldingBrowserService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingBrowserServiceServer >> rowanServiceClass [

	^RowanBrowserService
]

{ #category : 'updating' }
SpkScaffoldingBrowserServiceServer >> updateProjects [

	self rowanService: self rowanService updateProjects
]
