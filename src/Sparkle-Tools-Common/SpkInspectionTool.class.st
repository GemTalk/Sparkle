Class {
	#name : 'SpkInspectionTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'comparing' }
SpkInspectionTool >> = anObject [
	^ super = anObject and: [ explorerTool == anObject explorerTool ]
]

{ #category : 'accessing' }
SpkInspectionTool >> explorerTool [
	^explorerTool
]

{ #category : 'accessing' }
SpkInspectionTool >> explorerTool: object [
	explorerTool := object
]

{ #category : 'comparing' }
SpkInspectionTool >> hash [
	^ super hash bitXor: explorerTool identityHash
]

{ #category : 'accessing' }
SpkInspectionTool >> selfDescriptionOf: anObject [

	"Answer a string showing how the inspected object describes itself using printOn:.
        Objects that do not understand #printOn: will answer the empty string.
        Limit output size in case of very long or infinitely recursive implementation of #printOn:,
        but set a high limit."

	| stream |
	stream := SpkLimitedWriteStream on: String new.
	stream
		limit: 250000;
		limitBlock: [ ^ stream contents ].
	SpkReflection
		carefullySend: #printOn:
		withArguments: { stream }
		to: anObject
		ifNotUnderstood: [  ].
	^ stream contents
]
