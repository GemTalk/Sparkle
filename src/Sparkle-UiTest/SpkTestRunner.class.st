Class {
	#name : 'SpkTestRunner',
	#superclass : 'TestRunner',
	#category : 'Sparkle-UiTest'
}

{ #category : 'instance creation' }
SpkTestRunner class >> open [

	<example>
	super open
]

{ #category : 'processing' }
SpkTestRunner >> executeSuite: aTestSuite as: aBlock [

	" The block defines how to interact with the suite. run with a result or debug "

	aTestSuite
		when: TestAnnouncement
		do: [ :announcement | WorldState defer: [ self updateStatus: false ] ].
	[ 
	[ aBlock cull: aTestSuite cull: result ] ensure: [ 
		100 milliSeconds wait.
		aTestSuite unsubscribe: TestAnnouncement.
		result inspect ] ] forkAt: Processor activeProcess priority - 1
]
