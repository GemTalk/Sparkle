Class {
	#name : 'SpkInspectorFieldListViewServiceServer',
	#superclass : 'SpkInspectorFieldListViewService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkInspectorFieldListViewServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement:
		to: self.
	self
		refreshFromTool
]

{ #category : 'initialization' }
SpkInspectorFieldListViewServiceServer >> refreshFieldsFromTool [

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
SpkInspectorFieldListViewServiceServer >> refreshFromTool [

	| changed |
	changed := false.
	name = tool name ifFalse: [ 
		name := tool name.
		changed := true ].
	changed := changed | self refreshFieldsFromTool.
	^ changed
]

{ #category : 'accessing' }
SpkInspectorFieldListViewServiceServer >> tool [

	^tool
]

{ #category : 'accessing' }
SpkInspectorFieldListViewServiceServer >> tool: anInspectorViewTool [

	tool := anInspectorViewTool
]
