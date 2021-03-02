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
	| processBody  |
	processBody := [ 
	| resultObject |
	resultObject := method _executeInContext: context.
	explorerTool newInspectorToolOn: resultObject ].

	^self newProcessLauncherAndManager
		processBody: processBody;
		runProcess;
		waitForResult
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluationPriority [
	^ Processor userSchedulingPriority
]
