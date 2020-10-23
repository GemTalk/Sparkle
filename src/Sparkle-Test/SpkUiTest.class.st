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
