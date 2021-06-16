Class {
	#name : 'SpkScaffoldingClassService',
	#superclass : 'SpkScaffoldingRowanService',
	#instVars : [
		'name'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingClassService class >> templateClassName [

	^#SpkScaffoldingClassService
]

{ #category : 'accessing' }
SpkScaffoldingClassService >> name [

	^ name
]

{ #category : 'accessing' }
SpkScaffoldingClassService >> name: anObject [

	name := anObject
]
