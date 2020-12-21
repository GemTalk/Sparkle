Class {
	#name : 'SparkleLogin',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SparkleLogin class >> applicationName [ 
	^ 'Sparkle Connect'
]

{ #category : 'examples' }
SparkleLogin class >> example [ 
	<example>
	self new start
]

{ #category : 'running' }
SparkleLogin >> start [
	(self new: SpkLoginPresenter) openWithSpec
]
