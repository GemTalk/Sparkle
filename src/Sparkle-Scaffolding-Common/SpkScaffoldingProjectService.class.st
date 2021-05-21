Class {
	#name : 'SpkScaffoldingProjectService',
	#superclass : 'SpkScaffoldingRowanService',
	#instVars : [
		'rowanProjectService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingProjectService class >> templateClassName [

	^#SpkScaffoldingProjectService
]

{ #category : 'accessing' }
SpkScaffoldingProjectService >> rowanProjectService [
	^rowanProjectService
]

{ #category : 'accessing' }
SpkScaffoldingProjectService >> rowanProjectService: object [
	rowanProjectService := object
]
