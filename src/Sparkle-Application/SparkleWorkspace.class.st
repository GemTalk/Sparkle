Class {
	#name : 'SparkleWorkspace',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleWorkspace class >> example [ 
	<example>
	self new start
]

{ #category : 'running' }
SparkleWorkspace >> start [
	(self new: SpkWorkspacePresenter) openWithSpec
]
