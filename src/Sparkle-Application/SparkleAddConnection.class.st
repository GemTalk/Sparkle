Class {
	#name : 'SparkleAddConnection',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'running' }
SparkleAddConnection >> start [
	(self new: SpkAddConnectionPresenter) openWithSpec
]
