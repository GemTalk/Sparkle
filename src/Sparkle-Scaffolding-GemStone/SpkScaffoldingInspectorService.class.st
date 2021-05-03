Class {
	#name : 'SpkScaffoldingInspectorService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'rowanInspectorService'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'client' }
SpkScaffoldingInspectorService >> inspect: anOop [
	rowanInspectorService := RowanInspectorService new inspect: anOop
]

{ #category : 'accessing' }
SpkScaffoldingInspectorService >> rowanInspectorService [
	^rowanInspectorService
]

{ #category : 'accessing' }
SpkScaffoldingInspectorService >> rowanInspectorService: object [
	rowanInspectorService := object
]
