Class {
	#name : 'SparkyInspector',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkyInspector class >> example [ 
	<example>
	self new start
]

{ #category : 'instance creation' }
SparkyInspector class >> on: anOop [

	| inst | 
	inst := self new start. 
	inst oop: anOop. 
	^inst inspectOop
]

{ #category : 'running' }
SparkyInspector >> start [

	| presenter |
	presenter := self new: SpkSparkyInspectorPresenter.
	presenter openWithSpec.
	^ presenter
]
