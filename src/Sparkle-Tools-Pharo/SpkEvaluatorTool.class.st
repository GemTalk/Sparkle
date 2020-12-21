Class {
	#name : 'SpkEvaluatorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'inspectorTool',
		'oldSourceCode',
		'newSourceCode'
	],
	#category : 'Sparkle-Tools-Pharo'
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

{ #category : 'evaluating' }
SpkEvaluatorTool >> evaluateCode [

	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| context method resultObject |
	context := inspectorTool inspectedObject.

	[ method := self compileNewSourceCodeInContext: context ]
		on: SyntaxErrorNotification
		do: [ :ex | ^ self toolForCompilationError: ex ].


	[ resultObject := self evaluateMethod: method inContext: context ]
		on: Error
		do: [ :ex | ^ self toolForRuntimeErorr: ex ].
	^ SpkInspectorTool on: resultObject
]

{ #category : 'evaluating' }
SpkEvaluatorTool >> evaluateMethod: method inContext: context [

	^ SpkReflection
		  carefullySend: #withArgs:executeMethod:
		  withArguments: { 
				  #(  ).
				  method }
		  to: context
		  ifNotUnderstood: [ 
		  'Evaluation message not understood by this object' ]
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
