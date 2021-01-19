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
