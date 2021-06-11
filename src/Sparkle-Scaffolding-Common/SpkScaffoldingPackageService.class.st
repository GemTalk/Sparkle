Class {
	#name : 'SpkScaffoldingPackageService',
	#superclass : 'SpkScaffoldingRowanService',
	#instVars : [
		'name'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingPackageService class >> templateClassName [

	^#SpkScaffoldingPackageService
]

{ #category : 'accessing' }
SpkScaffoldingPackageService >> name [

	^ name
]

{ #category : 'accessing' }
SpkScaffoldingPackageService >> name: anObject [

	name := anObject
]
