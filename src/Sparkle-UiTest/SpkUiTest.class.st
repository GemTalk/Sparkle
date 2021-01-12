"
Common facilities for GUI testing
"
Class {
	#name : 'SpkUiTest',
	#superclass : 'TestCase',
	#instVars : [
		'connection',
		'uiWaitingSemaphore'
	],
	#category : 'Sparkle-UiTest'
}

{ #category : 'accessing' }
SpkUiTest >> connection [
	^ connection ifNil: [ self initializeConnection ]
]

{ #category : 'initialization' }
SpkUiTest >> initializeConnection [

	self subclassResponsibility
]

{ #category : 'running' }
SpkUiTest >> runCase [

	"Test code should not be run in UI thread, but we want to be able to launch it from the UI threadthreadSafe"

	| sem |
	sem := Semaphore new.
	[ 
	super runCase.
	sem signal ] fork.
	(sem wait: 10 seconds) ifTrue: [ 
		self error: 'Test forked thread did not complete in time.' ]
]

{ #category : 'running' }
SpkUiTest >> setUp [
	super setUp.
	uiWaitingSemaphore := Semaphore new
]
