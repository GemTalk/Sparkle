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
	| evaluationThread resultTool completion |
	completion := Semaphore new.
	evaluationThread := [ 
	| resultObject |
	resultObject := method _executeInContext: context.
	resultTool := (SpkInspectorTool on: resultObject)
		explorerTool: explorerTool;
		yourself.
	completion signal ] newProcess.
	evaluationThread
		priority: self evaluationPriority;
		debugActionBlock: [ :ex | 
					| debuggerThread threadToDebug |
					threadToDebug := Processor activeProcess.
					debuggerThread := [ 
					| debuggerTool |
					debuggerTool := SpkDebuggerTool forException: ex inProcess: threadToDebug.
					threadToDebug == evaluationThread
						ifTrue: [ 
							resultTool := debuggerTool.
							completion signal ]
						ifFalse: [ self error: 'Not yet implemented'	"This error should be handled by RSR's debugAction block."
									"debuggerTool announceInTaskspace: NeedToGetATaskspaceInScope"] ]
						newProcess.
					debuggerThread
						priority: self debuggingPriority;
						resume.
					threadToDebug suspend ];
		processType: 1;
		resume.
	completion wait.
	^ resultTool
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkEvaluatorTool >> evaluationPriority [
	^ Processor userSchedulingPriority
]
