Class {
	#name : 'SpkScaffoldingInspectorService',
	#superclass : 'SpkScaffoldingRowanService',
	#instVars : [
		'rowanInspectorService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingInspectorService class >> templateClassName [

	^#SpkScaffoldingInspectorService
]

{ #category : 'accessing' }
SpkScaffoldingInspectorService >> rowanInspectorService [
	^rowanInspectorService
]

{ #category : 'accessing' }
SpkScaffoldingInspectorService >> rowanInspectorService: object [
	rowanInspectorService := object
]
