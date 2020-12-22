Class {
	#name : 'SpkOLDEvaluatorTool',
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
SpkOLDEvaluatorTool >> accept [

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

{ #category : 'evaluating' }
SpkOLDEvaluatorTool >> evaluateCode [

	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| normalResult resultTool |
	[ normalResult := self evaluateNewSourceCode ]
		on: Error
		do: [ :ex | "Making an error tool goes here"
			self flag:
				'not the right thing to do, but for now we let things break'.
			ex pass ].
	resultTool := 'SpkInspectorTool' on: normalResult.
	^ resultTool
]

{ #category : 'evaluating' }
SpkOLDEvaluatorTool >> evaluateNewSourceCode [

	"Evaluate the newSource and, if successful, answer the result object."

	| context class compiler method |
	context := inspectorTool inspectedObject.
	class := SpkReflection classOf: context.
	compiler := class compiler.

	compiler
		source: newSourceCode;
		noPattern: true.
	method := compiler compileDoit.

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
SpkOLDEvaluatorTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkOLDEvaluatorTool >> initialize [

	super initialize.
	oldSourceCode := newSourceCode := ''
]

{ #category : 'accessing' }
SpkOLDEvaluatorTool >> inspectorTool: anObject [

	inspectorTool := anObject
]

{ #category : 'accessing' }
SpkOLDEvaluatorTool >> newSourceCode [

	^ newSourceCode
]

{ #category : 'accessing' }
SpkOLDEvaluatorTool >> newSourceCode: anObject [

	newSourceCode := anObject
]

{ #category : 'accessing' }
SpkOLDEvaluatorTool >> oldSourceCode [

	^ oldSourceCode
]

{ #category : 'accessing' }
SpkOLDEvaluatorTool >> oldSourceCode: anObject [

	oldSourceCode := anObject
]
