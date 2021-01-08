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
SpkScaffoldingDebuggerTest >> testHalt_01 [
	| client promise result |
	client := SpkScaffoldingServiceClient new registerWith: connectionA.
	promise := client gsDebugger_07: '7 halt'.
	result := (self expectWhen: promise) doitResult.
	self assert: result equals: 7
]

{ #category : 'tests' }
SpkScaffoldingDebuggerTest >> testHalt_02 [
	| client server sem |
	client := SpkScaffoldingServiceClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	sem := Semaphore new.
	RsrProcessModel
		fork: [ 
			| promise result |
			promise := client gsDebugger_07: '7 halt'.
			sem signal.
			result := (self expectWhen: promise) doitResult.
			self assert: result equals: 7 ]
		at: Processor userSchedulingPriority
		named: self class name , ' logouttestHalt doit proc'.
	sem wait.
	server halt
]
