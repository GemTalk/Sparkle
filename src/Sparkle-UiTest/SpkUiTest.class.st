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
	"This doesn't really work, but at least doesn't hang,
	which using the test button on the class in the browser
	does without this method."

	[ super run: aResult ] fork
]

{ #category : 'running' }
SpkUiTest >> setUp [
	super setUp.
	uiWaitingSemaphore := Semaphore new
]
