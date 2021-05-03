Class {
	#name : 'SpkScaffoldingInspectorServiceClient',
	#superclass : 'SpkScaffoldingInspectorService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'actions' }
SpkScaffoldingInspectorServiceClient >> inspect: anOop [

	^ remoteSelf inspect: anOop
]
