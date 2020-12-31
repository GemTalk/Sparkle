Class {
	#name : 'SparkleGitChecker',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleGitChecker class >> check [
	<example>
	self new start
]

{ #category : 'examples' }
SparkleGitChecker class >> example [ 
	self new start
]

{ #category : 'running' }
SparkleGitChecker >> start [
	(self new: SpkGitCheckerPresenter) openWithSpec
]
