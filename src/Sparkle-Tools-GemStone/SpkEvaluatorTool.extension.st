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
	processManager := self newProcessLauncherAndManager.
	processBody := [ 
	| resultObject |
	resultObject := [ method _executeInContext: context ]
		ifCurtailed: [ processManager returnValue: (explorerTool newInspectorToolOn: nil) ].
	explorerTool newInspectorToolOn: resultObject ].

	^ processManager
		processBody: processBody;
		runProcess;
		waitForResult
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluationPriority [
	^ Processor userSchedulingPriority
]
