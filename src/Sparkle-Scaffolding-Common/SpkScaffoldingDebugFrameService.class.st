Class {
	#name : 'SpkScaffoldingDebugFrameService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'label',
		'variableMap',
		'methodService'
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
