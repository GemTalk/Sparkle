Class {
	#name : 'SpkProcessServiceServer',
	#superclass : 'SpkProcessService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'instance creaction' }
SpkProcessServiceServer class >> forTool: aProcessTool [

	^self new
		initializeFromTool: aProcessTool;
		yourself
]

{ #category : 'actions' }
SpkProcessServiceServer >> createInspectorService [

	| newTool |
	newTool := parentService tool newInspectorToolOn: tool process.
	^SpkServiceFactory serviceForTool: newTool
]

{ #category : 'actions' }
SpkProcessServiceServer >> debugInNewExplorer [

	tool debugInNewExplorer
]

{ #category : 'initialization' }
SpkProcessServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkProcessServiceServer >> refreshFromTool [

	| changed newValue |
	changed := false.

	newValue := tool name.
	changed := changed | (name ~= newValue).
	name := newValue.

	newValue := tool oop.
	changed := changed | (oop ~= newValue).
	oop := newValue.

	newValue := tool priority.
	changed := changed | (priority ~= newValue).
	priority := newValue.

	newValue := tool stack.
	changed := changed | (stack ~= newValue).
	stack := newValue.

	newValue := tool status.
	changed := changed | (status ~= newValue).
	status := newValue.

	^changed
]
