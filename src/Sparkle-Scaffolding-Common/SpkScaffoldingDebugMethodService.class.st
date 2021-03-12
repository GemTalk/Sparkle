Class {
	#name : 'SpkScaffoldingDebugMethodService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'selector',
		'source',
		'meta',
		'className'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingDebugMethodService class >> templateClassName [

	^ #SpkScaffoldingDebugMethodService
]

{ #category : 'other' }
SpkScaffoldingDebugMethodService >> className [
	^ className
]

{ #category : 'other' }
SpkScaffoldingDebugMethodService >> meta [
	^ meta
]

{ #category : 'other' }
SpkScaffoldingDebugMethodService >> selector [
	^ selector
]

{ #category : 'other' }
SpkScaffoldingDebugMethodService >> source [
	^ source
]
