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
