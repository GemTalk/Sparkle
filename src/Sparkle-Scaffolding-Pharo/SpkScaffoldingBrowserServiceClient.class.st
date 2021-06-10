Class {
	#name : 'SpkScaffoldingBrowserServiceClient',
	#superclass : 'SpkScaffoldingBrowserService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'acccessing' }
SpkScaffoldingBrowserServiceClient >> rowanService [

	^ rsrRowanService
]

{ #category : 'actions' }
SpkScaffoldingBrowserServiceClient >> updateProjects [

	^remoteSelf updateProjects
]
