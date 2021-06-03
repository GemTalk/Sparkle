Class {
	#name : 'SparkyDebugger',
	#superclass : 'SpkApplication',
	#instVars : [
		'debuggerService'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkyDebugger class >> example [ 
	<example>
	self new start
]

{ #category : 'instance creation' }
SparkyDebugger class >> on: debuggerService [

	^self new debuggerService: debuggerService 
]

{ #category : 'accessing' }
SparkyDebugger >> debuggerService [

	^ debuggerService
]

{ #category : 'accessing' }
SparkyDebugger >> debuggerService: anObject [

	debuggerService := anObject
]

{ #category : 'initialization' }
SparkyDebugger >> initialize [

	super initialize.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileDisconnectedAnnouncement
		send: #close
		to: self.
]

{ #category : 'running' }
SparkyDebugger >> start [

	| presenter |
	(presenter := self new: SpkSparkyDebuggerPresenter) 
		debuggerService: debuggerService.
	presenter openWithSpec.
	^ presenter
]
