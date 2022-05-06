Class {
	#name : 'SpkInspectorRawViewServiceServer',
	#superclass : 'SpkInspectorRawViewService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkInspectorRawViewServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'refreshing' }
SpkInspectorRawViewServiceServer >> refreshFieldsFromTool [
	| changed fieldTools |
	changed := false.
	fields size < tool fieldTools size
		ifTrue: [ 
			changed := true.
			fields size + 1 to: tool fieldTools size do: [ :i | 
				fields
					add:
						(SpkInspectorFieldServiceServer new
							parentService: self;
							tool: (tool fieldTools at: i);
							yourself) ] ].
	fields size > tool fieldTools size
		ifTrue: [ 
			changed := true.
			fields size - tool fieldTools size timesRepeat: [ fields removeLast ] ].
	fieldTools := tool fieldTools.
	1 to: fieldTools size do: [ :i | 
		| fieldTool field newField |
		fieldTool := fieldTools at: i.
		field := fields at: i.
		fieldTool == field tool
			ifFalse: [ 
				changed := true.
				newField := self newFieldServiceFor: fieldTool.
				fields at: i put: newField.
				field := newField ].
		changed := changed | field refreshFromTool ].
	^ changed
]

{ #category : 'refreshing' }
SpkInspectorRawViewServiceServer >> refreshFromTool [

	| changed |
	changed := false.
	"Name will likely be nil at the first refresh."
	name = tool name ifFalse: [ 
		name := tool name.
		changed := true ].
	changed := changed | self refreshFieldsFromTool.
	^ changed
]

{ #category : 'accessing' }
SpkInspectorRawViewServiceServer >> tool [

	^tool
]

{ #category : 'accessing' }
SpkInspectorRawViewServiceServer >> tool: anInspectorViewTool [

	tool := anInspectorViewTool
]
