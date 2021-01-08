Class {
	#name : 'SpkScaffoldingDebuggerTest',
	#superclass : 'RsrSystemTestCase',
	#category : 'Sparkle-Scaffolding-GemStone-Test'
}

{ #category : 'running' }
SpkScaffoldingDebuggerTest >> setUp [

	super setUp.
	self initializeSocketConnections
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testDoit [
	| client promise result |
	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	promise := client gsDebugger_07: '{3+4} at: 1'.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 7
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testHalt [
	| client server sem debuggerClient |
	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new.
	sem := Semaphore new.
	RsrProcessModel
		fork: [ 
			| promise result |
			promise := client gsDebugger_07: '7 halt' usingDebugger: debuggerClient.
			result := (self expectWhen: promise) doitResult.
			self assert: result equals: 7.
			sem signal ]
		at: Processor userSchedulingPriority
		named: self class name , 'testHalt doit proc'.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore wait.
	debuggerClient processService resume.
	sem wait	"assertion passed"
]
