Class {
	#name : 'SpkInspectorServiceServer',
	#superclass : 'SpkInspectorService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer-Services'
}

{ #category : 'instance creation' }
SpkInspectorServiceServer class >> forTool: aTool [

	^ self new
		  initializeFromTool: aTool;
		  yourself
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> initializeEvaluatorsFromTool [

	evaluators := OrderedCollection new.
	tool evaluatorTools do: [ :evaluatorTool | 
		evaluators add: (SpkEvaluatorServiceServer new
				 parentService: self;
				 initializeFromTool: evaluatorTool;
				 yourself) ]
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> initializeFieldsFromTool [

	fields := OrderedCollection new.
	tool fieldTools do: [ :fieldTool | 
		fields add: (SpkInspectorFieldServiceServer new
				 parentService: self;
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
	self flag: 'Debugging output'.
	Transcript crShow:
		'refreshFromTool: ' , classMembershipDescription printString.
	selfDescription := tool selfDescription.
	self initializeFieldsFromTool.
	self initializeEvaluatorsFromTool
]
