Class {
	#name : 'SparkleGitChecker',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleGitChecker class >> example [ 
	<example>
	self new start
]

{ #category : 'running' }
SparkleGitChecker >> start [
	(self new: SpkGitCheckerPresenter) openWithSpec
]
