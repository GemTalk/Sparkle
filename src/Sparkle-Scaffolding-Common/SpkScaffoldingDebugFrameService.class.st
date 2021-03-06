Class {
	#name : 'SpkScaffoldingDebugFrameService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'label',
		'variableMap',
		'methodService',
		'methodSource',
		'startPos',
		'stopPos'
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
SpkScaffoldingDebugFrameService >> stopPos [

	^ stopPos
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> variableMap [

	self subclassResponsibility
]