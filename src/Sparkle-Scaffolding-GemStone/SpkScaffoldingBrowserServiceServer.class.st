Class {
	#name : 'SpkScaffoldingBrowserServiceServer',
	#superclass : 'SpkScaffoldingBrowserService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'updating' }
SpkScaffoldingBrowserServiceServer >> abortTransaction [

	self rowanService: self rowanService abortTransaction
]

{ #category : 'accessing' }
SpkScaffoldingBrowserServiceServer >> rowanServiceClass [

	^RowanBrowserService
]

{ #category : 'updating' }
SpkScaffoldingBrowserServiceServer >> updateProjects [

	self rowanService: self rowanService updateProjects
]
