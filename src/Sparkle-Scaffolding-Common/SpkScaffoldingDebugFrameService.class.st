Class {
	#name : 'SpkScaffoldingDebugFrameService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'label',
		'variableMap',
		'variableOopMap',
		'methodService',
		'methodSource',
		'startPos',
		'stopPos',
		'stepPoint'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService class >> templateClassName [

	^ #SpkScaffoldingDebugFrameService
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> label [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> methodService [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> methodSource [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> startPos [

	^ startPos
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> stepPoint [

	^ stepPoint
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> stopPos [

	^ stopPos
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> variableMap [

	self subclassResponsibility
]
