Class {
	#name : 'SpkInspectorServiceServer',
	#superclass : 'SpkInspectorService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'initialization' }
SpkInspectorServiceServer >> initializeEvaluatorsFromTool [

	evaluators := OrderedCollection new.
	tool evaluatorTools do: [ :evaluatorTool | 
		evaluators add:
			(SpkEvaluatorServiceServer new initializeFromTool: evaluatorTool) ]
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> initializeFieldsFromTool [

	fields := OrderedCollection new.
	tool fieldTools do: [ :fieldTool | 
		fields add: (SpkInspectorFieldServiceServer new
				 evaluationContext: self;
				 initializeFromTool: fieldTool;
				 yourself) ]
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> refreshFromTool [

	oop := tool oop.
	classMembershipDescription := tool classMembershipDescription.
	selfDescription := tool selfDescription.
	self initializeFieldsFromTool.
	self initializeEvaluatorsFromTool
]
