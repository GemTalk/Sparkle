Class {
	#name : 'SparkleTraditionalInspector',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleTraditionalInspector class >> example [ 
	<example>
	self new start
]

{ #category : 'running' }
SparkleTraditionalInspector >> start [

	| presenter |
	presenter := self new: SpkTraditionalInspectorPresenter.
	presenter openWithSpec.
	^ presenter
]
