Class {
	#name : 'SpkEvaluatorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'inspectorTool',
		'oldSourceCode',
		'newSourceCode'
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
	self flag:
		'Need to make announcement here. All existing inspectors need to check whether their object changed state.'.
	^ resultTool
]

{ #category : 'compiling' }
SpkEvaluatorTool >> compileNewSourceCodeInContext: anObject [

	"Answer a method compiled from my new source code in the context of the given object"

	| compiler class |
	class := SpkReflection classOf: anObject.
	compiler := class compiler.

	compiler
		source: newSourceCode;
		noPattern: true.
	^ compiler compileDoit
]

{ #category : 'accessing' }
SpkEvaluatorTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkEvaluatorTool >> initialize [

	super initialize.
	oldSourceCode := newSourceCode := ''
]

{ #category : 'accessing' }
SpkEvaluatorTool >> inspectorTool: anObject [

	inspectorTool := anObject
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

{ #category : 'as yet unclassified' }
SpkEvaluatorTool >> toolForCompilationError: aSyntaxErrorNotification [

	^ SpkCompilationErrorTool forException: aSyntaxErrorNotification
]

{ #category : 'as yet unclassified' }
SpkEvaluatorTool >> toolForRuntimeError: anError [

	^ SpkRuntimeErrorTool forException: anError
]
