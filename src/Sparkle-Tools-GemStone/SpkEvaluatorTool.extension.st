Extension { #name : 'SpkEvaluatorTool' }

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> compilationExceptionClass [
        ^ CompileError
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> compileNewSourceCodeInContext: anObject [
	^ newSourceCode
		_compileInContext: anObject
		symbolList: GsCurrentSession currentSession symbolList
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluateMethod: method inContext: context [
	| completion evaluatorDebugAction evaluationProcess resultTool debugAction |
	completion := Semaphore new.
	"Bugs in the debugger handled by evaluatorDebugAction."
	evaluatorDebugAction := Processor activeProcess debugActionBlock.
	debugAction := 
		[ :ex | | debuggerProcess processToDebug originalPriority|
		processToDebug := Processor activeProcess.
		originalPriority := processToDebug priority.
		debuggerProcess := 
			[ | debuggerTool |
			"Must suspend before initializing tool, or process state could change without the debugger realizing."
			processToDebug suspend. 
			debuggerTool := SpkDebuggerTool new 
				explorerTool: explorerTool;
				process: processToDebug;
				exception: ex;
				debugActionForContinue: debugAction.
			processToDebug == evaluationProcess
				ifTrue: [ resultTool := debuggerTool.
							completion signal ]
				ifFalse: [ self error: 'Not yet implemented'	"This error should be handled by RSR's debugAction block."	
							"debuggerTool announceInTaskspace: NeedToGetATaskspaceInScope" ] ] newProcess.
		self setPrioritiesOfDebugger: debuggerProcess relativeToDebugged: processToDebug.
		debuggerProcess
			debugActionBlock: evaluatorDebugAction;
		"This resume preempts processToDebug, and the debuggerProcess takes over."
			resume.
		" If I get here, the debugger has decided to proceed processToDebug.
		Its priority will have been changed if it was running at max priority, set it back before continuing."
		processToDebug priority: originalPriority  ].
	evaluationProcess := 
		[ | resultObject |
		resultObject := method _executeInContext: context.
		resultTool := (SpkInspectorTool on: resultObject)
			explorerTool: explorerTool;
			yourself.
		completion signal ] newProcess.
	evaluationProcess
		priority: self evaluationPriority;
		name: 'Evaluation';
		debugActionBlock: debugAction;
		breakpointLevel: 1;
		resume.
	completion wait.
	^ resultTool
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluationPriority [
	^ Processor userSchedulingPriority
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> setPrioritiesOfDebugger: debuggerProcess relativeToDebugged: processToDebug [
	"In order to reliably suspend the debugged process, the debugger must run at a higher priority.
	Normally, just run the debugger one higher, but if that's impossible lower the debugged process priority.
	It will be restored upon continue (see #evaluateMethod:inContext:)."

	| debuggedPriority |
	debuggedPriority := processToDebug priority.
	debuggedPriority = Processor highestPriority
		ifFalse: [ debuggerProcess priority: debuggedPriority + 1 ]
		ifTrue: [ 
			debuggerProcess priority: debuggedPriority.
			processToDebug priority: debuggedPriority - 1 ]
]
