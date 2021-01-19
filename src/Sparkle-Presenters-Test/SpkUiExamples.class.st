"
Tests that open a UI to be manually played with.
Not fully automated tests, no assertions.
"
Class {
	#name : 'SpkUiExamples',
	#superclass : 'TestCase',
	#category : 'Sparkle-Presenters-Test-Tests'
}

{ #category : 'examples' }
SpkUiExamples class >> defaultLocalTaskspace [

	"With real services in the local image"

	<example>
	| connection taskspace |
	connection := RsrInMemoryConnectionSpecification new connect.
	taskspace := SparkleTaskspace new.
	taskspace
		connection: connection;
		openNewDefaultTaskspace.
	"connection log addSink: RsrTranscriptSink new.
	connection specification connectionB log addSink:
		RsrTranscriptSink new"
]

{ #category : 'examples' }
SpkUiExamples class >> defaultRemoteTaskspace [

	"With real services in a separate process."

	<example>
	| spec connection taskspace |
	spec := RsrInitiateConnection host: '127.0.0.1' port: 29299.
	connection := spec connect.
	taskspace := SparkleTaskspace new.
	taskspace
		connection: connection;
		openNewDefaultTaskspace
	"connection log addSink: RsrTranscriptSink new.
	connection specification connectionB log addSink:
		RsrTranscriptSink new"
]
