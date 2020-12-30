Class {
	#name : 'SpkScaffoldingDebugMethodServiceServer',
	#superclass : 'SpkScaffoldingDebugMethodService',
	#instVars : [
		'rowanMethodService'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingDebugMethodServiceServer >> rowanMethodService [
	^rowanMethodService
]

{ #category : 'accessing' }
SpkScaffoldingDebugMethodServiceServer >> rowanMethodService: object [
	rowanMethodService := object.
	selector := rowanMethodService selector.
	source := rowanMethodService source
]
