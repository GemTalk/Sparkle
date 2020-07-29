"
In this application, a user can enter code snippets, evaluate them, and inspect the results, in a sparkly sort of way.
"
Class {
	#name : 'SparkleWorkspace',
	#superclass : 'SpkApplication',
	#instVars : [
		'window',
		'presenter'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'accessing' }
SparkleWorkspace >> presenter [
	^ presenter
]

{ #category : 'accessing' }
SparkleWorkspace >> presenter: anObject [
	presenter := anObject
]

{ #category : 'running' }
SparkleWorkspace >> start [
	presenter := self new: SpkWorkspacePresenter.
	presenter openWithSpec "Sets window"
]

{ #category : 'accessing' }
SparkleWorkspace >> window [
	^ window
]

{ #category : 'accessing' }
SparkleWorkspace >> window: anObject [
	window := anObject
]
