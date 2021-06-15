Class {
	#name : 'SpkScaffoldingBrowserServiceClient',
	#superclass : 'SpkScaffoldingBrowserService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'actions' }
SpkScaffoldingBrowserServiceClient >> abortTransaction [

	^remoteSelf abortTransaction
]

{ #category : 'actions' }
SpkScaffoldingBrowserServiceClient >> commitTransaction [

	^remoteSelf commitTransaction
]

{ #category : 'actions' }
SpkScaffoldingBrowserServiceClient >> updateProjects [

	^remoteSelf updateProjects
]
