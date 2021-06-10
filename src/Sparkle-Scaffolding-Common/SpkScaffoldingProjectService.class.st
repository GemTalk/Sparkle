Class {
	#name : 'SpkScaffoldingProjectService',
	#superclass : 'SpkScaffoldingRowanService',
	#instVars : [
		'name'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingProjectService class >> templateClassName [

	^#SpkScaffoldingProjectService
]

{ #category : 'accessing' }
SpkScaffoldingProjectService >> name [
	^name
]

{ #category : 'accessing' }
SpkScaffoldingProjectService >> name: object [
	name := object
]
