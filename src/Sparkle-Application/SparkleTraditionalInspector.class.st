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

{ #category : 'instance creation' }
SparkleTraditionalInspector class >> on: anOop [

	| inst | 
	inst := self new start. 
	inst oop: anOop. 
	^inst inspectOop
]

{ #category : 'running' }
SparkleTraditionalInspector >> start [

	| presenter |
	presenter := self new: SpkTraditionalInspectorPresenter.
	presenter openWithSpec.
	^ presenter
]
