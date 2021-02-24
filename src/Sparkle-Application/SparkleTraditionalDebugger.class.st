Class {
	#name : 'SparkleTraditionalDebugger',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleTraditionalDebugger class >> example [ 
	<example>
	self new start
]

{ #category : 'running' }
SparkleTraditionalDebugger >> start [

	| presenter |
	(presenter := self new: SpkTraditionalDebuggerPresenter) openWithSpec.
	^presenter
]
