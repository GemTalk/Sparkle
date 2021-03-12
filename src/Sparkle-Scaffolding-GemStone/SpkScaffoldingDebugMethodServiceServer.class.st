Class {
	#name : 'SpkScaffoldingDebugMethodServiceServer',
	#superclass : 'SpkScaffoldingDebugMethodService',
	#instVars : [
		'rowanMethodService'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingDebugMethodServiceServer >> method [
	^ self rowanMethodService _method
]

{ #category : 'accessing' }
SpkScaffoldingDebugMethodServiceServer >> rowanMethodService [
	^rowanMethodService
]

{ #category : 'accessing' }
SpkScaffoldingDebugMethodServiceServer >> rowanMethodService: object [
	rowanMethodService := object.
	selector := rowanMethodService selector.
	source := rowanMethodService source.
	meta := rowanMethodService meta.
	className := rowanMethodService className.
	stepPoints := rowanMethodService stepPoints
		collect: [ :assoc | Array with: assoc key with: assoc value ]
]

{ #category : 'debugging' }
SpkScaffoldingDebugMethodServiceServer >> setBreakAtStepPoint: aStepPoint [
	(self method setBreakAtStepPoint: aStepPoint pType: 1)
		ifNil: [ self error: 'error setting breakpoint' ]
]
