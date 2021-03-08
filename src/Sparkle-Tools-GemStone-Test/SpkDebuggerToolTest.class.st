Class {
	#name : 'SpkDebuggerToolTest',
	#superclass : 'SpkEvaluationTest',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'support' }
SpkDebuggerToolTest >> executedCodeFrameInDebugger: debugger [
	| doitFrames |
	self assert: debugger class equals: SpkDebuggerTool.

	doitFrames := debugger frames
		select: [ :frame | 
			self assert: frame class equals: SpkDebuggerFrameTool.
			frame description = 'Executed Code ' ].
	self assert: doitFrames size equals: 1.
	^ doitFrames first
]

{ #category : 'other' }
SpkDebuggerToolTest >> testBreakpoint01 [
	| method debugger |
	method := SpkTestClassForDebugging compiledMethodAt: #'twelve'.
	self assert: method class equals: GsNMethod.
	[ 
	method setBreakAtStepPoint: 3 breakpointLevel: 1.
	self deny: GsProcess usingNativeCode.
	evaluatorTool newSourceCode: 'SpkTestClassForDebugging new twelve'.
	debugger := evaluatorTool evaluateCode.
	self halt ]
		ensure: [ method clearAllBreaks ]
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testContinueOnce [
	"Get a debugger, continue, get an inspector"

	| debugger inspector |
	evaluatorTool newSourceCode: '3 pause + 4'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	inspector := debugger continue.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: 7
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testContinueTwice [
	"Get a debugger, continue, get the same debugger, continue, get inspector"

	| debugger1 debugger2 inspector frame |
	evaluatorTool newSourceCode: '(3 pause + 4) pause + 5'.
	debugger1 := evaluatorTool evaluateCode.
	self assert: debugger1 class equals: SpkDebuggerTool.
	frame := self executedCodeFrameInDebugger: debugger1.
	self assert: frame currentSourceInterval equals: (4 to: 8).
	debugger2 := debugger1 continue.
	self assert: debugger1 == debugger2.
	self assert: frame currentSourceInterval equals: (15 to: 19).
	inspector := debugger2 continue.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: 12
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testCurrentSourceIntervalForPrimitive [
	"Do we get a reasonable source code interval for a primitive method?"

	| debugger frameTool interval|
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	frameTool := debugger frames at: 1.
	interval := frameTool currentSourceInterval.
	self 
		assert: frameTool description equals: 'GsNMethod class >> _gsReturnToC';
		assert: frameTool stepPoint equals: 1;
		assert: interval class equals: Interval;
		assert: interval begin > 100;
		assert: interval size equals: 4
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testFrameDescription [
	"Is a frame's description reasonable?"

	| debugger frame |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.

	frame := self executedCodeFrameInDebugger: debugger.
	self assert: frame index equals: 7
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testFrameIndex [
	"Are frames indexed from the bottom of the stack?"

	| debugger frameTool |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	frameTool := debugger frames at: 1.
	self
		assert: frameTool class equals: SpkDebuggerFrameTool;
		assert: frameTool index equals: 1;
		assert: frameTool description equals: 'GsNMethod class >> _gsReturnToC'
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testNumberOfFrames [
	"Can the debugger get frames from the process?"

	| debugger |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	self assert: debugger frames size > 6
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testTerminate [
	"Get a debugger, terminate, verify termination"

	| debugger process |
	evaluatorTool newSourceCode: '3 pause + 4'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	process := debugger process.

	self deny: process _isTerminated.
	debugger terminate.
	self assert: process _isTerminated
]
