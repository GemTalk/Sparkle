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
	| processBody processManager processLauncher |
	processManager := self newProcessManager.

	processBody := [ 
	| resultObject |
	resultObject :=  method _executeInContext: context.
	explorerTool newInspectorToolOn: resultObject ].

	processLauncher := self
		newProcessLauncherWithBody: processBody
		manager: processManager.

	^ processLauncher launch
]
