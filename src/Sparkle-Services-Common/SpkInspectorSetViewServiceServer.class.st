Class {
	#name : 'SpkInspectorSetViewServiceServer',
	#superclass : 'SpkInspectorSetViewService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkInspectorSetViewServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'refreshing' }
SpkInspectorSetViewServiceServer >> refreshFieldsFromTool [
	| changed fieldServicesByTool newFieldSet sortedFields |
	changed := false.	

	" Index existing field services by their tool."
	fieldServicesByTool := IdentityDictionary new: fields size.
	fields
		do: [ :fieldService | fieldServicesByTool at: fieldService tool put: fieldService ].

	newFieldSet := IdentitySet new: tool fieldTools size.
	tool fieldTools
		do: [ :fieldTool | 
			| fieldService |
			fieldService := fieldServicesByTool
				at: fieldTool
				ifAbsent: [ 
					changed := true.
					self newFieldServiceFor: fieldTool ].
			changed := changed | fieldService refreshFromTool.
			newFieldSet add: fieldService ].
	fields size ~= newFieldSet size
		ifTrue: [ changed := true ].
	sortedFields := newFieldSet
		asSortedCollection: [ :a :b | (a columnAt: 1) < (b columnAt: 1) ].
	fields := sortedFields asOrderedCollection.
	^ changed
]

{ #category : 'refreshing' }
SpkInspectorSetViewServiceServer >> refreshFromTool [

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
SpkInspectorSetViewServiceServer >> tool [

	^tool
]

{ #category : 'accessing' }
SpkInspectorSetViewServiceServer >> tool: anInspectorViewTool [

	tool := anInspectorViewTool
]
