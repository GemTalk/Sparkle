Class {
	#name : 'SpkEvaluatorTool2',
	#superclass : 'SpkEvaluatorTool',
	#instVars : [
		'taskspaceTool',
		'resultTool',
		'resultReady',
		'evaluationProcess'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'as yet unclassified' }
SpkEvaluatorTool2 >> OLDevaluateMethod: method inContext: context [

	| completion evaluatorDebugAction  debugAction |
	completion := Semaphore new.
	"Bugs in the debugger handled by evaluatorDebugAction."
	evaluatorDebugAction := Processor activeProcess debugActionBlock.
	debugAction := [ :ex | 
	               | debuggerProcess processToDebug originalPriority |
	               processToDebug := Processor activeProcess.
	               originalPriority := processToDebug priority.
	               debuggerProcess := [ 
	                                  | debuggerTool |
	                                  "Must suspend before initializing tool, or process state could change without the debugger realizing."
	                                  processToDebug suspend.
	                                  debuggerTool := SpkDebuggerTool new
		                                                  explorerTool:
			                                                  explorerTool;
		                                                  process:
			                                                  processToDebug;
		                                                  exception: ex;
		                                                  
		                                                  debugActionForContinue:
			                                                  debugAction.
	                                  processToDebug == evaluationProcess
		                                  ifTrue: [ 
			                                  resultTool := debuggerTool.
			                                  completion signal ]
		                                  ifFalse: [ 
			                                  self error: 'Not yet implemented' "This error should be handled by RSR's debugAction block."
			                                  "debuggerTool announceInTaskspace: NeedToGetATaskspaceInScope" ] ]
		                                  newProcess.
	               self
		               setPrioritiesOfDebugger: debuggerProcess
		               relativeToDebugged: processToDebug.
	               debuggerProcess
		               debugActionBlock: evaluatorDebugAction;
		               "This resume preempts processToDebug, and the debuggerProcess takes over."
			               resume.
	               " If I get here, the debugger has decided to proceed processToDebug.
	Its priority will have been changed if it was running at max priority, set it back before continuing."
	               processToDebug priority: originalPriority ].
	evaluationProcess := [ 
	                     | resultObject |
	                     resultObject := method _executeInContext:
		                                     context.
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

{ #category : 'as yet unclassified' }
SpkEvaluatorTool2 >> evaluateMethod: method inContext: context [

	| processBody processManager |
	processBody := [ 
	               | resultObject |
	               resultObject := method _executeInContext: context.
	               (SpkInspectorTool on: resultObject)
		               explorerTool: explorerTool;
		               yourself ].
	processManager := SpkProcessLauncherAndManager new
		                  taskspaceTool: taskspaceTool;
		                  debuggerDebugAction:
			                  Processor activeProcess debugActionBlock;
		                  processBody: processBody;
		                  processPriority: self evaluationPriority;
		                  yourself.

	^ processManager
		  runProcess;
		  waitForResult
]

{ #category : 'as yet unclassified' }
SpkEvaluatorTool2 >> evaluatorProcessResultBlock [


	^ [ :debugger | 
	  resultTool := debugger.
	  resultReady signal ]
]

{ #category : 'as yet unclassified' }
SpkEvaluatorTool2 >> otherProcessResultBlock [

	^ [ :debugger | 
	  debugger
		  refreshFromProcess;
		  notifyTaskspace ]
]

{ #category : 'as yet unclassified' }
SpkEvaluatorTool2 >> processToEvaluateMethod: method inContext: contextObject [

	^ [ 
	  | resultObject |
	  resultObject := method _executeInContext: contextObject.
	  resultTool := (SpkInspectorTool on: resultObject)
		                explorerTool: explorerTool;
		                yourself.
	  resultReady signal ] newProcess
]
