Class {
	#name : 'SpkEvaluatorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'inspectorTool',
		'oldSourceCode',
		'newSourceCode',
		'updatedServices'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'public' }
SpkEvaluatorTool >> acceptAnnouncing: anAnnouncement [
	"Evaluate newSourceCode through an undoable action. Answer a new Tool for the result."

	| action resultTool |
	action := SpkEvaluatorAcceptAction new
		target: self;
		oldSourceCode: oldSourceCode;
		newSourceCode: newSourceCode;
		announcement: anAnnouncement;
		yourself.
	resultTool := explorerTool performAction: action.
	^ resultTool
]

{ #category : 'accessing' }
SpkEvaluatorTool >> evaluateCode [
	self flag: 'Now used only by tests, which should be updated.'.
	^ self evaluateCodeAnnouncing: SpkExecutionAnnouncement new
]

{ #category : 'accessing' }
SpkEvaluatorTool >> evaluateCodeAnnouncing: anAnnouncement [
	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| context method resultTool |
	context := inspectorTool inspectedObject.

	[ method := self compileNewSourceCodeInContext: context ]
		on: self compilationExceptionClass
		do: [ :ex | ^ self toolForCompilationError: ex ].

	resultTool := self evaluateMethod: method inContext: context.

	taskspaceTool announce: anAnnouncement.
	^ resultTool
]

{ #category : 'accessing' }
SpkEvaluatorTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkEvaluatorTool >> initialize [
	super initialize.
	updatedServices := Set new.
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

{ #category : 'other' }
SpkEvaluatorTool >> updatedServices [
	^ updatedServices
]
