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

{ #category : 'support' }
SpkDebuggerToolTest >> frameIn: debugger
withDescriptionContaining: aString [

	^debugger frames detect: [ :each | each description includesString: aString ].
]

{ #category : 'code to test' }
SpkDebuggerToolTest >> restartFrameTestMethod [
	8 printString.
	^ (5 + 7) printString
]

{ #category : 'support' }
SpkDebuggerToolTest >> restartInFrame: frameTool [

	^frameTool restartAnnouncing: SpkExecutionAnnouncement new
]

{ #category : 'support' }
SpkDebuggerToolTest >> stepIntoInFrame: frameTool [

	^frameTool stepIntoAnnouncing: SpkExecutionAnnouncement new
]

{ #category : 'support' }
SpkDebuggerToolTest >> stepOverInFrame: frameTool [

	^frameTool stepOverAnnouncing: SpkExecutionAnnouncement new
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testBreakpoint01 [
	| method debugger frames frame localVariables variable inspector |
	method := SpkTestClassForDebugging compiledMethodAt: #'twelve'.
	self assert: method class equals: GsNMethod.
	[ 
	method setBreakAtStepPoint: 3 breakpointLevel: 1.
	evaluatorTool newSourceCode: 'SpkTestClassForDebugging new twelve'.
	debugger := evaluatorTool evaluateCode.
	frames := debugger frames.
	frame := frames
		detect: [ :each | each description includesString: 'SpkTestClassForDebugging' ].	"
	Have we properly omitted the glue frames following a breakpoint?"
	self assert: frame equals: frames last.
	self assert: (frame description includesString: 'twelve').
	self assert: frame stepPoint equals: 3.
	localVariables := frame localVariables.
	variable := localVariables at: 1.
	self assert: (variable columnAt: 1) equals: 'receiver'.
	variable := localVariables at: 2.
	self assert: (variable columnAt: 2) equals: '7'.
	variable := localVariables at: 3.
	self assert: (variable columnAt: 2) equals: '5'.
	inspector := debugger proceed.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12 ]
		ensure: [ method clearAllBreaks ]
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testClearAllBreaks [
	| method debugger frames frame inspector |
	method := SpkTestClassForDebugging compiledMethodAt: #'twelve'.
	self assert: method class equals: GsNMethod.
	[ 
	self assert: method _allBreakpoints size equals: 0.
	method setBreakAtStepPoint: 3 breakpointLevel: 1.
	self assert: method _allBreakpoints size equals: 4.
	evaluatorTool newSourceCode: 'SpkTestClassForDebugging new twelve'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	frames := debugger frames.
	frame := frames
		detect: [ :each | each description includesString: 'SpkTestClassForDebugging' ].
	self assert: frame stepPoint equals: 3.
	inspector := debugger proceed.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12.
	self assert: method _allBreakpoints size equals: 4.
	method clearAllBreaks.
	self assert: method _allBreakpoints size equals: 0.
	inspector := evaluatorTool evaluateCode.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12 ]
		ensure: [ method clearAllBreaks ].
	self assert: method _allBreakpoints size equals: 0
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
SpkDebuggerToolTest >> testDebug [

	| debugger frame inspector |
	evaluatorTool newSourceCode: '37 + 63'.
	debugger := evaluatorTool debugAnnouncing: SpkExecutionAnnouncement new.
	self
		assert: debugger class
		equals: SpkDebuggerTool.
	frame := self
		frameIn: debugger
		withDescriptionContaining: 'Executed Code'.
	self
		assert: frame stepPoint
		equals: 1.
	inspector := debugger proceed.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: 100
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testFrameDescription [
	"Is a frame's description reasonable?"

	| debugger frame |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.

	frame := self executedCodeFrameInDebugger: debugger.
	self assert: frame index equals: 11
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
SpkDebuggerToolTest >> testHaltGlueTrimming [
	"A halt should trim all top glue down through Object>>halt."

	| debugger frames  execCodeFrame topFrame |
	evaluatorTool newSourceCode: '3 halt + 4'.
	debugger := evaluatorTool evaluateCode.
	frames := debugger nonGlueFrames.
	topFrame := frames last.
	self assert: topFrame index equals: 11.
	execCodeFrame := self executedCodeFrameInDebugger: debugger.
	self assert: execCodeFrame identicalTo: topFrame
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
SpkDebuggerToolTest >> testProceedChangedDepth [
	"Get a debugger, proceed, get the same debugger with different stack depth."

	| debugger1 debugger2 frame depth1 depth2 index1 index2 |
	evaluatorTool newSourceCode: '3 pause + 4 / 0'.
	debugger1 := evaluatorTool evaluateCode.
	self assert: debugger1 class equals: SpkDebuggerTool.
	depth1 := debugger1 frames size.
	frame := self executedCodeFrameInDebugger: debugger1.
	index1 := frame index.
	self assert: frame currentSourceInterval equals: (3 to: 7).
	debugger2 := debugger1 proceed.
	self assert: debugger1 == debugger2.
	depth2 := debugger2 frames size.
	self assert: depth1 < depth2.
	self assert: frame == (self executedCodeFrameInDebugger: debugger1).
	index2 := frame index.
	self assert: index1 equals: index2.
	self assert: frame currentSourceInterval equals: (13 to: 13)
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testProceedOnce [
	"Get a debugger, proceed, get an inspector"

	| debugger inspector |
	evaluatorTool newSourceCode: '3 pause + 4'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	inspector := debugger proceed.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: 7
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testProceedTwice [
	"Get a debugger, proceed, get the same debugger, proceed, get inspector"

	| debugger1 debugger2 inspector frame |
	evaluatorTool newSourceCode: '(3 pause + 4) pause + 5'.
	debugger1 := evaluatorTool evaluateCode.
	self assert: debugger1 class equals: SpkDebuggerTool.
	frame := self executedCodeFrameInDebugger: debugger1.
	self assert: frame currentSourceInterval equals: (4 to: 8).
	debugger2 := debugger1 proceed.
	self assert: debugger1 == debugger2.
	self assert: (frame == (self executedCodeFrameInDebugger: debugger1)).
	self assert: frame currentSourceInterval equals: (15 to: 19).
	inspector := debugger2 proceed.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: 12
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testRestartFrame [
	"Get a debugger, proceed, get an inspector"

	| debugger frame restartFrame printStringFrame inspector |
	evaluatorTool newSourceCode: 'self halt. SpkDebuggerToolTest new restartFrameTestMethod'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	frame := self executedCodeFrameInDebugger: debugger.
	debugger := self
		stepOverInFrame: frame;
		stepOverInFrame: frame;
		stepIntoInFrame: frame.

	"Move execution to the start of the #printString method of SmallInteger."
	restartFrame := self frameIn: debugger withDescriptionContaining: 'restartFrameTestMethod'.
	self
		assert: restartFrame stepPoint
		equals: 1.
	debugger := self
		stepOverInFrame: restartFrame;
		stepIntoInFrame: restartFrame.

	"Ensure execution is in the correct place."
	restartFrame := self frameIn: debugger withDescriptionContaining: 'restartFrameTestMethod'.
	printStringFrame := self frameIn: debugger withDescriptionContaining: 'SmallInteger >> printString'.
	self
		assert: restartFrame stepPoint
		equals: 2.
	self
		assert: printStringFrame stepPoint
		equals: 1.

	"Ensure restarting a frame in middle of the stack removes higher frames
	and the step point in the frame is reset back to 1."
	debugger := self restartInFrame: restartFrame.
	restartFrame := self frameIn: debugger withDescriptionContaining: 'restartFrameTestMethod'.
	self
		should: [self frameIn: debugger withDescriptionContaining: 'SmallInteger >> printString']
		raise: LookupError.
	self
		assert: restartFrame stepPoint
		equals: 1.
	self
		assert: restartFrame index
		equals: debugger frames size.

	"Ensure that restarting the 'top frame' behaves correctly"
	debugger := self restartInFrame: restartFrame.
	restartFrame := self frameIn: debugger withDescriptionContaining: 'restartFrameTestMethod'.
	self
		assert: restartFrame stepPoint
		equals: 1.
	self
		assert: restartFrame index
		equals: debugger frames size.

	"Ensure we can resume and get the correct result."
	inspector := debugger proceed.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: '12'
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testStepOver01 [
	| method debugger debugger2 frames frame localVariables variable inspector |
	method := SpkTestClassForDebugging compiledMethodAt: #'twelve'.
	self assert: method class equals: GsNMethod.
	[ 
	method setBreakAtStepPoint: 1 breakpointLevel: 1.
	evaluatorTool newSourceCode: 'SpkTestClassForDebugging new twelve'.
	debugger := evaluatorTool evaluateCode.
	frames := debugger nonGlueFrames.
	frame := frames
		detect: [ :each | each description includesString: 'SpkTestClassForDebugging' ].	
	"Have we properly omitted the glue frames following a breakpoint?"
	self assert: frame equals: frames last.
	self assert: (frame description includesString: 'twelve').
	self assert: frame stepPoint equals: 1.
	localVariables := frame localVariables.
	self assert: localVariables size equals: 1.
	variable := localVariables at: 1.
	self
		assert: (variable columnAt: 1) equals: 'receiver';
		assert: frame currentSourceInterval equals: (1 to: 6).
	debugger2 := frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self
		assert: debugger2 == debugger;
		assert: frame == frames last;
		assert: frame currentSourceInterval equals: (13 to: 13).
	frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self assert: frame currentSourceInterval equals: (17 to: 17).
	frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self assert: frame currentSourceInterval equals: (9 to: 9).
	frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self assert: debugger nonGlueFrames size equals: frames size - 1.
	inspector := debugger proceed.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12 ]
		ensure: [ method clearAllBreaks ]
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testTerminate [
	"Get a debugger, terminate, verify termination.
	As of 2021-07-19, this test is failing. 
	Adding a brief delay before the final assertion makes the test pass,
	but this *should* not be required. Leaving failing pending further
	investigation."

	| debugger process |
	evaluatorTool newSourceCode: '3 pause + 4'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	process := debugger process.

	self deny: process _isTerminated.
	debugger terminateAnnouncing: SpkExecutionAnnouncement new.
	self assert: process _isTerminated
]

{ #category : 'tests' }
SpkDebuggerToolTest >> testTerminate01 [
	"Get a debugger, terminate, get the same debugger with the 
	same executedCode frame, proceed, get inspector"

	| debugger1 debugger2 inspector execCodeFrame bottomFrame topFrame |
	evaluatorTool newSourceCode: '[3 pause + 4] ifCurtailed: [12 pause]'.
	debugger1 := evaluatorTool evaluateCode.
	self assert: debugger1 class equals: SpkDebuggerTool.
	bottomFrame := debugger1 frames at: 1.
	topFrame := debugger1 frames at: debugger1 frames size.
	execCodeFrame := self executedCodeFrameInDebugger: debugger1.	"Should be on ifCurtailed:"
	self assert: execCodeFrame currentSourceInterval equals: (15 to: 26).
	debugger2 := debugger1 terminateAnnouncing: SpkExecutionAnnouncement new.
	self
		assert: debugger1 == debugger2;
		assert: bottomFrame == (debugger2 frames at: 1);
		assert: execCodeFrame == (self executedCodeFrameInDebugger: debugger1);
		deny: topFrame == (debugger2 frames at: debugger2 frames size);
		assert: execCodeFrame currentSourceInterval equals: (15 to: 26).	"Should still be on ifCurtailed:"
	inspector := debugger2 proceed.
	self assert: inspector class equals: SpkProcessTerminatedTool
]
