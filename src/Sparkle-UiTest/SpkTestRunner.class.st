"
Differs from the standard test runner in that it does not run tests in the UI process, but runs the entire selected suite in a new process.
This makes it suitable for running UI tests that involve multiple processes, where the test must trigger UI actions from a non-UI process.
Most non-UI tests don't care what process they run in, so this runner is also suitable for running most other tests. Therefore, it installs itself as the standard test runner upon load.

"
Class {
	#name : 'SpkTestRunner',
	#superclass : 'TestRunner',
	#category : 'Sparkle-UiTest'
}

{ #category : 'tools registry' }
SpkTestRunner class >> beDefaultTestRunner [

	self registerToolsOn: Smalltalk tools
]

{ #category : 'tools registry' }
SpkTestRunner class >> initialize [

	self beDefaultTestRunner
]

{ #category : 'instance creation' }
SpkTestRunner class >> open [

	<example>
	super open
]

{ #category : 'actions' }
SpkTestRunner >> debugSuite: aTestSuite [

	[ super debugSuite: aTestSuite ] fork
]

{ #category : 'processing' }
SpkTestRunner >> executeSuite: aTestSuite as: aBlock [

	" The block defines how to interact with the suite. run with a result or debug "

	aTestSuite
		when: TestAnnouncement
		do: [ :announcement | 
		WorldState defer: [ self updateStatus: false ] ].

	[ aBlock cull: aTestSuite cull: result ] ensure: [ 
		aTestSuite unsubscribe: TestAnnouncement ]
]

{ #category : 'api' }
SpkTestRunner >> initialExtent [

	^ 900 @ 500
]

{ #category : 'accessing-ui' }
SpkTestRunner >> label [
	^ 'Sparkle Test Runner' 
]

{ #category : 'actions' }
SpkTestRunner >> runTestSuites: testSuites [

	[ 
	super runTestSuites: testSuites.
	RsrConnection allInstancesDo: [ :each | each close ] ] fork
]
