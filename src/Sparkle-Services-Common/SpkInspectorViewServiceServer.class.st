Class {
	#name : 'SpkInspectorViewServiceServer',
	#superclass : 'SpkInspectorViewService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'instance creation' }
SpkInspectorViewServiceServer class >> forTool: anInspectorViewTool [

	^self new
		tool: anInspectorViewTool;
		yourself
]

{ #category : 'initialization' }
SpkInspectorViewServiceServer >> refreshFieldsFromTool [

	| changed fieldTools |
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
		fields size - tool fieldTools size timesRepeat: [ fields removeLast ] ].
	fieldTools := tool fieldTools.
	1 to: fieldTools size do: [ :i | 
		| fieldTool field newField |
		fieldTool := fieldTools at: i.
		field := fields at: i.
		fieldTool == field tool ifFalse: [ 
			changed := true.
			newField := SpkInspectorFieldServiceServer new
				            parentService: self;
				            tool: fieldTool;
				            yourself.
			fields at: i put: newField.
			field := newField ].
		changed := changed | field refreshFromTool ].
	^ changed
]

{ #category : 'initialization' }
SpkInspectorViewServiceServer >> refreshFromTool [

	| changed |
	changed := false.
	name = tool name ifFalse: [ 
		name := tool name.
		changed := true ].
	changed := changed | self refreshFieldsFromTool.
	^ changed
]

{ #category : 'accessing' }
SpkInspectorViewServiceServer >> tool [

	^tool
]

{ #category : 'accessing' }
SpkInspectorViewServiceServer >> tool: anInspectorViewTool [

	tool := anInspectorViewTool
]
