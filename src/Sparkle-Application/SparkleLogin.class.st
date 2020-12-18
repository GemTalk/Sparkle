Class {
	#name : 'SparkleLogin',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleLogin class >> example [ 
	<example>
	self new start
]

{ #category : 'running' }
SparkleLogin >> start [
	(self new: SpkLoginPresenter) openWithSpec
]
