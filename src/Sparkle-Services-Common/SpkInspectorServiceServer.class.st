Class {
	#name : 'SpkInspectorServiceServer',
	#superclass : 'SpkInspectorService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
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
SpkInspectorServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement:
		to: self.
	self
		refreshFromTool;
		initializeEvaluatorsFromTool
]

{ #category : 'as yet unclassified' }
SpkInspectorServiceServer >> receiveExecutionAnnouncement: announcement [

	self refreshFromTool ifTrue: [ 
		announcement updatedInspectors add: self ]
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> refreshFieldsFromTool [

	| changed |
	changed := false.
	fields size < tool fieldTools size ifTrue: [ 
		changed := true.
		fields size + 1 to: tool fieldTools size do: [ :i | 
			fields add: (SpkInspectorFieldServiceServer new
					 parentService: self;
					 tool: (tool fieldTools at: i);
					 yourself) ] ].
	fields size > tool fieldTools size ifTrue: [ 
		changed := true.
		fields removeLast: fields size - tool fieldTools size ].
	fields do: [ :field | changed := changed | field refreshFromTool ].
	^ changed
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> refreshFromTool [

	| changed |
	changed := false.

	oop = tool oop ifFalse: [ changed := true ].
	classMembershipDescription = tool classMembershipDescription 
		ifFalse: [ changed := true ].
	selfDescription = tool selfDescription ifFalse: [ changed := true ].
	oop := tool oop.
	classMembershipDescription := tool classMembershipDescription.
	selfDescription := tool selfDescription.
	changed := changed | self refreshFieldsFromTool.
	^ changed
]

{ #category : 'accessing' }
SpkInspectorServiceServer >> tool [

	^ tool
]
