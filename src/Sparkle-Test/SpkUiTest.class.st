"
Tests that open a UI to be manually played with.
Not fully automated tests, no assertions.
"
Class {
	#name : 'SpkUiTest',
	#superclass : 'TestCase',
	#category : 'Sparkle-Test-UI Setup'
}

{ #category : 'tests' }
SpkUiTest >> testTaskspace1 [

	SparkleTaskspace openFromService:
		SpkTestTaskspaceServiceClient testTaskspace1
]

{ #category : 'tests' }
SpkUiTest >> testTaskspace2 [
	"With real services in the local image"

	| connection |
	connection := RsrInMemoryConnectionSpecification new connect.
	
	SparkleTaskspace openFromService:
		SpkTestTaskspaceServiceClient testTaskspace1
]
