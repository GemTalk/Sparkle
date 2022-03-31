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
SpkProcessServiceServer >> createInspectorServiceIn: xService [
	"Sent from client."

	^ xService newInspectorServiceOn: tool process
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

{ #category : 'refreshing' }
SpkProcessServiceServer >> postRegistration [
	"I will typically have been added to the services needing update collection
	before this message is sent."

	super postRegistration.
	self refreshIsVital
]

{ #category : 'refreshing' }
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

	changed := changed | self refreshIsVital.

	^changed
]

{ #category : 'refreshing' }
SpkProcessServiceServer >> refreshIsVital [
	| newValue changed |
	self connection
		ifNil: [ 
			isVital := false.
			^ true	"If new, always need refreshing." ].
	newValue := self connection vitalProcesses includes: tool process.
	changed := isVital ~= newValue.
	isVital := newValue.
	^ changed
]
