Class {
	#name : 'SpkScaffoldingInspectorServiceClient',
	#superclass : 'SpkScaffoldingInspectorService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'actions' }
SpkScaffoldingInspectorServiceClient >> inspect: anOop [

	^ remoteSelf inspect: anOop
]

{ #category : 'actions' }
SpkScaffoldingInspectorServiceClient >> printLoadedVersions [

	^ remoteSelf printLoadedVersions
]

{ #category : 'actions' }
SpkScaffoldingInspectorServiceClient >> printOop: anOop [

	^ remoteSelf printOop: anOop
]
