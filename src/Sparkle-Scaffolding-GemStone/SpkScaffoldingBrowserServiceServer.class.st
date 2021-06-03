Class {
	#name : 'SpkScaffoldingBrowserServiceServer',
	#superclass : 'SpkScaffoldingBrowserService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingBrowserServiceServer >> newRowanService [

	^RowanBrowserService new
]

{ #category : 'updating' }
SpkScaffoldingBrowserServiceServer >> updateProjects [

	self rowanService updateProjects
]
