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

{ #category : 'deferred message' }
SpkUiTest >> defer: aValuable [

	WorldState defer: aValuable
]

{ #category : 'initialization' }
SpkUiTest >> initializeConnection [

	self subclassResponsibility
]

{ #category : 'running' }
SpkUiTest >> setUp [
	super setUp.
	uiWaitingSemaphore := Semaphore new
]
