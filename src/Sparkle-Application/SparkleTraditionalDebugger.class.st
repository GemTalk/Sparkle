Class {
	#name : 'SparkleTraditionalDebugger',
	#superclass : 'SpkApplication',
	#instVars : [
		'debuggerService'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleTraditionalDebugger class >> example [ 
	<example>
	self new start
]

{ #category : 'instance creation' }
SparkleTraditionalDebugger class >> on: debuggerService [

	^self new debuggerService: debuggerService 
]

{ #category : 'accessing' }
SparkleTraditionalDebugger >> debuggerService [

	^ debuggerService
]

{ #category : 'accessing' }
SparkleTraditionalDebugger >> debuggerService: anObject [

	debuggerService := anObject
]

{ #category : 'initialization' }
SparkleTraditionalDebugger >> initialize [

	super initialize.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileDisconnectedAnnouncement
		send: #close
		to: self.
]

{ #category : 'running' }
SparkleTraditionalDebugger >> start [

	| presenter |
	(presenter := self new: SpkTraditionalDebuggerPresenter) 
		debuggerService: debuggerService.
	presenter openWithSpec.
	^ presenter
]
