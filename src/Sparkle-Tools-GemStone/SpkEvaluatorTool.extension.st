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
	| processBody processManager |
	processBody := [ 
	| resultObject |
	resultObject := method _executeInContext: context.
	(SpkInspectorTool on: resultObject)
		explorerTool: explorerTool;
		yourself ].
	processManager := SpkProcessLauncherAndManager new
		taskspaceTool: taskspaceTool;
		debuggerDebugAction: Processor activeProcess debugActionBlock;
		processName: 'Evaluation';
		processBody: processBody;
		processPriority: self evaluationPriority;
		yourself.

	^ processManager
		runProcess;
		waitForResult
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluationPriority [
	^ Processor userSchedulingPriority
]
