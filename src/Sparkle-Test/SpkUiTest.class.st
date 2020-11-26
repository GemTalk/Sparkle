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
	| connection  |
	connection := RsrInMemoryConnectionSpecification new connect
		              connectionA.
	"connection inspect."

	SparkleTaskspace named: 'Testing' inConnection: connection
]

{ #category : 'examples' }
SpkUiTest class >> fakeServicesExample [

	<example>
	SparkleTaskspace openFromService:
		SpkTestTaskspaceServiceClient testTaskspace1
]
