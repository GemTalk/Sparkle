"
Common facilities for GUI testing
"
Class {
	#name : 'SpkUiTest',
	#superclass : 'SpkTestCase',
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

{ #category : 'running' }
SpkUiTest >> debug [

	| result |
	[ super debug ] fork.
	result := TestResult new.

	"The test is forked, so We cannot tell whether the it will pass, fail, or error. 
	Let's just make it yellow in the browser."
	result addFailure: self.
	^ result
]

{ #category : 'deferred message' }
SpkUiTest >> defer: aValuable [

	self currentWorld defer: aValuable
]

{ #category : 'initialization' }
SpkUiTest >> initializeConnection [

	self subclassResponsibility
]

{ #category : 'running' }
SpkUiTest >> run: aResult [
	"Don't actually run the tests, let the user know that
	they can't be run, but can be individually debugged."

	| message |
	message := 'These UI tests are multi-threaded and 
	rely on the UI thread processing events during the test,
	so they cannot be run from a test runner that does not 
	have a thread-aware way of reporting results.
	Debug each test method individually using the buttons 
	in the browser. 
	If no debugger opens the test passed.'.
	Warning signal: message
]

{ #category : 'running' }
SpkUiTest >> setUp [
	super setUp.
	uiWaitingSemaphore := Semaphore new
]
