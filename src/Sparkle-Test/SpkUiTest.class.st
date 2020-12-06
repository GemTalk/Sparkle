"
Tests that open a UI to be manually played with.
Not fully automated tests, no assertions.
"
Class {
	#name : 'SpkUiTest',
	#superclass : 'TestCase',
	#category : 'Sparkle-Test-UI Setup'
}

{ #category : 'examples' }
SpkUiTest class >> defaultLocalTaskspace [

	"With real services in the local image"

	<example>
	| connection taskspace |
	connection := RsrInMemoryConnectionSpecification new connect.
	taskspace := SparkleTaskspace new.
	taskspace
		connection: connection;
		openNewDefaultTaskspace
]

{ #category : 'examples' }
SpkUiTest class >> fakeServicesExample [

	<example>
	SparkleTaskspace openFromService:
		SpkTestTaskspaceServiceClient testTaskspace1
]

{ #category : 'examples' }
SpkUiTest class >> namedLocalTaskspace [

	"With real services in the local image"

	<example>
	| connection  |
	connection := RsrInMemoryConnectionSpecification new connect
		              connectionA.
	self flag: 'connectionA should not be needed here. Remove once RSR is changed.'.

	SparkleTaskspace named: 'Testing' inConnection: connection
]
