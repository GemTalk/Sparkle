Class {
	#name : 'SparkleProcessBrowser',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleProcessBrowser class >> example [ 
	<example>
	self new start
]

{ #category : 'running' }
SparkleProcessBrowser >> start [
	(self new: SpkProcessesPresenter) openWithSpec
]
