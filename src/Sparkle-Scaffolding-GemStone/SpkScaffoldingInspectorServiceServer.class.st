Class {
	#name : 'SpkScaffoldingInspectorServiceServer',
	#superclass : 'SpkScaffoldingInspectorService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> inspect: anOop [
	rowanInspectorService := RowanInspectorService new inspect: anOop
]
