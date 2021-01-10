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
SpkEvaluatorTool >> debuggingPriority [
	^ Processor userInterruptPriority
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluateMethod: method inContext: context [
	| completion evaluatorDebugAction evaluationThread resultTool debugAction |
	completion := Semaphore new.
	"Bugs in the debugger handled by evaluatorDebugAction."
	evaluatorDebugAction := Processor activeProcess debugActionBlock.
	debugAction := 
		[ :ex | | debuggerThread processToDebug |
		processToDebug := Processor activeProcess.
		debuggerThread := 
			[ | debuggerTool |
			debuggerTool := SpkDebuggerTool new 
				process: processToDebug;
				exception: ex;
				debugActionForContinue: debugAction.
			processToDebug == evaluationThread
				ifTrue: [ resultTool := debuggerTool.
							completion signal ]
				ifFalse: [ self error: 'Not yet implemented'	"This error should be handled by RSR's debugAction block."	
							"debuggerTool announceInTaskspace: NeedToGetATaskspaceInScope" ] ] newProcess.
		debuggerThread
			priority: self debuggingPriority;
			debugActionBlock: evaluatorDebugAction;
			resume.
		processToDebug suspend ].
	evaluationThread := 
		[ | resultObject |
		resultObject := method _executeInContext: context.
		resultTool := (SpkInspectorTool on: resultObject)
			explorerTool: explorerTool;
			yourself.
		completion signal ] newProcess.
	evaluationThread
		priority: self evaluationPriority;
		debugActionBlock: debugAction;
		processType: 1;
		resume.
	completion wait.
	^ resultTool
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluationPriority [
	^ Processor userSchedulingPriority
]
