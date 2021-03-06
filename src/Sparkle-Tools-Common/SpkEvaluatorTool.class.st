Class {
	#name : 'SpkEvaluatorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'inspectorTool',
		'oldSourceCode',
		'newSourceCode',
		'updatedInspectors'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'public' }
SpkEvaluatorTool >> accept [

	"Evaluate newSourceCode through an undoable action. Answer a new Tool for the result."

	| action resultTool |
	action := SpkEvaluatorAcceptAction new
		          target: self;
		          oldSourceCode: oldSourceCode;
		          newSourceCode: newSourceCode;
		          yourself.
	resultTool := explorerTool performAction: action.
	^ resultTool
]

{ #category : 'accessing' }
SpkEvaluatorTool >> evaluateCode [

	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| context method resultTool |
	context := inspectorTool inspectedObject.

	[ method := self compileNewSourceCodeInContext: context ]
		on: self compilationExceptionClass
		do: [ :ex | ^ self toolForCompilationError: ex ].


	resultTool := self evaluateMethod: method inContext: context.
	updatedInspectors := Set new.
	taskspaceTool announceExecutionWithUpdatedInspectors:
		updatedInspectors.
	^ resultTool
]

{ #category : 'accessing' }
SpkEvaluatorTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkEvaluatorTool >> initialize [

	super initialize.

	updatedInspectors := Set new.
	newSourceCode := oldSourceCode := ''
]

{ #category : 'accessing' }
SpkEvaluatorTool >> inspectorTool: anObject [

	inspectorTool := anObject
]

{ #category : 'accessing' }
SpkEvaluatorTool >> newProcessLauncherAndManager [

	^ SpkProcessLauncherAndManager new
		  taskspaceTool: taskspaceTool;
		  debuggerDebugAction: Processor activeProcess debugActionBlock;
		  processName: 'Evaluation';
		  processPriority: self evaluationPriority;
		  processBreakpointLevel: 1;
		  explorerTool: explorerTool;
		  yourself
]

{ #category : 'accessing' }
SpkEvaluatorTool >> newSourceCode [

	^ newSourceCode
]

{ #category : 'accessing' }
SpkEvaluatorTool >> newSourceCode: anObject [

	newSourceCode := anObject
]

{ #category : 'accessing' }
SpkEvaluatorTool >> oldSourceCode [

	^ oldSourceCode
]

{ #category : 'accessing' }
SpkEvaluatorTool >> oldSourceCode: anObject [

	oldSourceCode := anObject
]

{ #category : 'tool creation' }
SpkEvaluatorTool >> toolForCompilationError: aCompilationException [

	^ (SpkCompilationErrorTool forException: aCompilationException)
		  taskspaceTool: taskspaceTool;
		  yourself
]

{ #category : 'accessing' }
SpkEvaluatorTool >> updatedInspectors [

	^ updatedInspectors
]

{ #category : 'accessing' }
SpkEvaluatorTool >> updatedInspectors: anObject [

	updatedInspectors := anObject
]
